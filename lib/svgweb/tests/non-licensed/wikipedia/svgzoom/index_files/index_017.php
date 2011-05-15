// <source lang="javascript">

/*
  Image annotations. Draw rectangles onto image thumbnail displayed on image description
  page and associate them with textual descriptions that will be displayed when the mouse
  moves over the rectangles. If an image has annotations, display the rectangles. Add a
  button to create new annotations.
  
  Note: if an image that has annotations is overwritten by a new version, only display the
  annotations if the size of the top image matches the stored size exactly. To recover
  annotations, one will need to edit the image description page manually, adjusting image
  sizes and rectangle coordinates, or re-enter annotations.
 
  Author: [[User:Lupo]], June 2009
  License: Quadruple licensed GFDL, GPL, LGPL and Creative Commons Attribution 3.0 (CC-BY-3.0)
 
  Choose whichever license of these you like best :-)

  See http://commons.wikimedia.org/wiki/Help:Gadget-ImageAnnotator for documentation.
*/

// Global: hookEvent, getElementsByClassName, importScript (wiki.js)
// Global: wgPageName, wgCurRevisionId, wgUserGroups, wgRestrictionEdit (inline script on the page)
// Global: wgAction, wgNamespaceNumber, wgUserLanguage, wgContentLanguage (inline script)

if (typeof (ImageAnnotator) == 'undefined') { // Guard against multiple inclusions

importScript ('MediaWiki:LAPI.js');
importScript ('MediaWiki:Tooltips.js');
importScript ('MediaWiki:TextCleaner.js');
importScript ('MediaWiki:UIElements.js');

var ImageAnnotator_DefaultLanguage = wgContentLanguage;

var ImageAnnotation = function () {this.initialize.apply (this, arguments);}

// Border widths must remain 1px, colors and dashing may be changed.
ImageAnnotation.outer_border  = '1px solid #666666'; // Gray
ImageAnnotation.inner_border  = '1px solid yellow';
ImageAnnotation.active_border = '1px solid #FFA500'; // Orange
ImageAnnotation.new_border    = '1px solid red';     // For drawing a rectangle

ImageAnnotation.compare = function (a, b)
{
  var result = b.area () - a.area ();
  if (result != 0) return result;
  return a.model.id - b.model.id; // Just to make sure the order is complete
};

ImageAnnotation.prototype =
{
  view    : null,  // Rectangle to be displayed on image: a div with pos and size
  model   : null,  // Internal representation of the annotation
  tooltip : null,  // Tooltip to display the annotation
  content : null,  // Content of the tooltip
  viewer  : null,  // Reference to the viewer this note belongs to
  
  initialize : function (node, viewer, id)
  {
    var is_new = false;
    var view_w = 0, view_h = 0, view_x = 0, view_y = 0;

    this.viewer = viewer;
    if (LAPI.DOM.hasClass (node, ImageAnnotator.annotation_class)) {
      // Extract the info we need
      var x = ImageAnnotator.getIntItem ('view_x_' + id, viewer.scope);
      var y = ImageAnnotator.getIntItem ('view_y_' + id, viewer.scope);
      var w = ImageAnnotator.getIntItem ('view_w_' + id, viewer.scope);
      var h = ImageAnnotator.getIntItem ('view_h_' + id, viewer.scope);
      var html = ImageAnnotator.getRawItem ('content_' + id, viewer.scope);
      if (x === null || y === null || w === null || h === null || html === null)
        throw new Error ('Invalid note');
      if (x < 0 || x >= viewer.full_img.width || y < 0 || y >= viewer.full_img.height)
        throw new Error ('Invalid note: origin invalid on note ' + id);
      if (   x + w > viewer.full_img.width + 10
          || y + h > viewer.full_img.height + 10)
      {
        throw new Error ('Invalid note: size extends beyond image on note ' + id);
      }
      // Notes written by early versions may be slightly too large, whence the + 10 above. Fix this.
      if (x + w > viewer.full_img.width) w = viewer.full_img.width - x;
      if (y + h > viewer.full_img.height) h = viewer.full_img.height - y;
      view_w = Math.floor (w / viewer.factors.dx);
      view_h = Math.floor (h / viewer.factors.dy);
      view_x = Math.floor (x / viewer.factors.dx);
      view_y = Math.floor (y / viewer.factors.dy);
      this.view = 
        LAPI.make (
            'div', null
          , { position   : 'absolute'
             ,display    : 'none'
             ,lineHeight : '0px' // IE
             ,fontSize   : '0px' // IE
             ,top        : "" + view_y + 'px'
             ,left       : "" + view_x + 'px'
             ,width      : "" + view_w + 'px'
             ,height     : "" + view_h + 'px'
            }
        );
      // We'll add the view to the DOM once we've loaded all notes
      this.model =
        { id       : id
         ,dimension: {x: x, y: y, w: w, h: h}
         ,wiki     : ""
         ,html     : html.cloneNode (true)
        };
    } else {
      is_new = true;
      this.view = node;
      this.model = 
        { id       : -1
         ,dimension: null
         ,wiki     : ""
         ,html     : null
        };
      view_w = this.view.offsetWidth - 2; // Subtract cumulated border widths
      view_h = this.view.offsetHeight - 2;
      view_x = this.view.offsetLeft;
      view_y = this.view.offsetTop;
    }
    // Enforce a minimum size of the view. Center the new rectangle over the previous center.
    // If we overlap the image boundary, adjustRectangleSize will take care of it later.
    if (view_w < 6) {view_x = Math.floor (view_x + view_w / 2 - 3); view_w = 6; }
    if (view_h < 6) {view_y = Math.floor (view_y + view_h / 2 - 3); view_h = 6; }
    Object.merge (
        { left: "" + view_x + 'px', top: "" + view_y + 'px'
         ,width: "" + view_w + 'px', height: "" + view_h + 'px'}
      , this.view.style
    ); 
    this.view.style.zIndex   = 500;       // Below tooltips
    this.view.style.border   = ImageAnnotation.outer_border;           
    this.view.appendChild (
      LAPI.make (
          'div', null
        , { lineHeight : '0px' // IE
           ,fontSize   : '0px' // IE
           ,width      : "" + Math.max (view_w - 2, 0) + 'px' // -2 to leave space for the border
           ,height     : "" + Math.max (view_h - 2, 0) + 'px'
           ,border     : ImageAnnotation.inner_border
          }
      )
      // width=100% doesn't work right: inner div's border appears outside on right and bottom on FF.
    );
    if (is_new) viewer.adjustRectangleSize (this.view);
    // IE somehow passes through event to the view even if covered by our cover, displaying the tooltips
    // when drawing a new rectangle, which is confusing and produces a selection nightmare. Hence we just
    // display raw rectangles without any tooltips attached while drawing. Yuck.
    this.dummy = this.view.cloneNode (true);
    viewer.img_div.appendChild (this.dummy);
    if (!is_new) {
      // New notes get their tooltip only once the editor has saved, otherwise IE may try to
      // open them if the mouse moves onto the view even though there is the cover above them!
      this.setTooltip ();
    }
  },
  
  setTooltip : function ()
  {
    if (this.tooltip || !this.view) return; // Already set, or corrupt
    this.tooltip = new Tooltip
      (  this.view.firstChild
       , this.display.bind (this)
       , { activate     : Tooltip.HOVER
          ,deactivate   : Tooltip.LEAVE
          ,close_button : null
          ,mode         : Tooltip.MOUSE
          ,mouse_offset : {x: -10, y: -10, dx: 1, dy: 1}
          ,open_delay   : 0
          ,hide_delay   : 0
          ,onclose      : (function (tooltip, evt) {
                             if (this.view) this.view.style.border = ImageAnnotation.outer_border;
                             // Hide all boxes if we're outside the image. Relies on hide checking the
                             // coordinates! (Otherwise, we'd always hide...)
                             if (evt) this.viewer.hide (evt);
                           }).bind (this)
          ,onopen       : (function (tooltip) {
                             if (this.view) this.view.style.border = ImageAnnotation.active_border;
                           }).bind (this)
         }
       , ImageAnnotator.tooltip_styles
      );
  },

  display : function (evt)
  {
    if (!this.content) {
      this.content = LAPI.make ('div');
      var main = LAPI.make ('div');
      this.content.appendChild (main);
      this.content.main = main;
      if (this.model.html) main.appendChild (this.model.html.cloneNode (true));
      if (ImageAnnotator.haveAjax) {
        this.content.button_section =
          LAPI.make
            ( 'div'
             ,null
             ,{ fontSize : 'smaller'
               ,textAlign: (ImageAnnotator.is_rtl ? 'left' : 'right')
               ,borderTop: ImageAnnotator.tooltip_styles.border
              }
            );
        this.content.appendChild (this.content.button_section);
        this.content.button_section.appendChild
          (LAPI.DOM.makeLink
            (  '#'
             , ImageAnnotator.UI.get ('wpImageAnnotatorEdit', true)
             , null
             , LAPI.Evt.makeListener (this, this.edit)
            )
          );
        this.content.button_section.appendChild (document.createTextNode ('\xa0'));
        this.content.button_section.appendChild
          (LAPI.DOM.makeLink
            (  '#'
             , ImageAnnotator.UI.get ('wpImageAnnotatorDelete', true)
             , null
             , LAPI.Evt.makeListener (this, this.remove)
            )
          );
      }
    }
    return this.content;
  },
  
  edit : function (evt)
  {
    ImageAnnotator.editor.editNote (this);
    if (evt) return LAPI.Evt.kill (evt);
    return false;
  },
  
  remove : function (evt)
  {
    if (!this.content) { // New note: just destroy it.
      this.destroy ();
      return;
    }
    // Close and remove tooltip only if edit succeeded! Where and how to display error messages?
    if (evt) {
      // Directly called through the link in the note's tooltip. Must confirm.
      if (!window.confirm (ImageAnnotator.UI.get ('wpImageAnnotatorDeleteConfirm', true)))
        return LAPI.Evt.kill (evt);
      // Re-show tooltip in case it was hidden because of the alert.
      this.tooltip.show_tip (null, false);
    }
    var self = this;
    var spinnerId = 'image_annotation_delete_' + this.model.id;
    LAPI.Ajax.injectSpinner (this.content.button_section.lastChild, spinnerId);
    if (this.tooltip) this.tooltip.size_change ();
    LAPI.Ajax.editPage (
        wgPageName
      , function (doc, editForm, failureFunc, revision_id)
        {
          try {
            if (revision_id && revision_id != wgCurRevisionId)
              throw new Error ('#Page version (revision ID) mismatch: edit conflict.');

            var textbox = editForm.wpTextbox1;
            if (!textbox) throw new Error ('#Server replied with invalid edit page.');
            var pagetext = textbox.value.replace(/\r\n/g, '\n');
            // Normalize different end-of-line handling. Opera and IE may use \r\n, whereas other
            // browsers just use '\n'. Note that all browsers do the right thing if a '\n' is added.
            // We normally don't care, but here we need this to make sure we don't leave extra line
            // breaks when we remove the note.

            ImageAnnotator.setWikitext (pagetext);

            var span = ImageAnnotator.findNote (pagetext, self.model.id);
            if (!span) { // Hmmm? Doesn't seem to exist
              LAPI.Ajax.removeSpinner (spinnerId);
              if (self.tooltip) self.tooltip.size_change ();
              self.destroy ();
              return;
            }
            var char_before = 0;
            var char_after  = 0;
            if (span.start > 0) char_before = pagetext.charCodeAt (span.start - 1);
            if (span.end < pagetext.length) char_after = pagetext.charCodeAt (span.end);
            if (   String.fromCharCode (char_before) == '\n'
                && String.fromCharCode (char_after)  == '\n')
              span.start = span.start - 1;
            pagetext = pagetext.substring (0, span.start) + pagetext.substring (span.end);
            textbox.value = pagetext;
            var summary = editForm.wpSummary;
            if (!summary)
              throw new Error ('#Summary field not found. Check that edit pages have valid XHTML.');
            summary.value = 
              '[[MediaWiki talk:Gadget-ImageAnnotator.js|Removing note]]'
              + (self.model.wiki
                 ? (': ' + (self.model.wiki.length > 150
                            ? self.model.wiki.substring (0, 150)
                            : self.model.wiki
                           ).replace ('\n', ' ')
                   )
                 : ""
                );
          } catch (ex) {
            failure (null, ex);
            return;
          }
          var edit_page = doc;
          LAPI.Ajax.submitEdit (
              editForm
            , function (request) {
                if (edit_page.isFake && (typeof (edit_page.dispose) == 'function'))
                  edit_page.dispose ();
                var revision_id = request.responseText.match (/var wgCurRevisionId = (\d+);/);
                if (revision_id) revision_id = parseInt (revision_id[1]);
                if (!revision_id) {
                  failureFunc
                    (request, new Error ('Revision ID not found. Please reload the page.'));
                  return;
                }
                wgCurRevisionId = revision_id; // Bump revision id!!
                LAPI.Ajax.removeSpinner (spinnerId);
                if (self.tooltip) self.tooltip.size_change ();
                self.destroy ();
              }
            , function (request, ex) {
                if (edit_page.isFake && (typeof (edit_page.dispose) == 'function'))
                  edit_page.dispose ();
                failureFunc (request, ex);
              }
          );
        }
      , function (request, ex) {
          // Failure. What now? TODO: Implement some kind of user feedback.
          LAPI.Ajax.removeSpinner (spinnerId);
          if (self.tooltip) self.tooltip.size_change ();
        }
    );

    if (evt) return LAPI.Evt.kill (evt);
    return false;
  },

  destroy : function ()
  {
    if (this.view) LAPI.DOM.removeNode (this.view);
    if (this.dummy) LAPI.DOM.removeNode (this.dummy);
    if (this.tooltip) this.tooltip.hide_now ();
    if (this.model && this.model.id > 0 && this.viewer) this.viewer.deregister (this);
    this.model   = null;
    this.view    = null;
    this.content = null;
    this.tooltip = null;
    this.viewer  = null;
  },

  area : function ()
  {
    if (!this.model || !this.model.dimension) return 0;
    return (this.model.dimension.w * this.model.dimension.h);
  }

}; // end ImageAnnotation

var ImageAnnotationEditor = function () {this.initialize.apply (this, arguments);};

if (typeof (ImageAnnotationEditor_columns) == 'undefined')
  var ImageAnnotationEditor_columns = 50;

ImageAnnotationEditor.prototype =
{
  initialize : function ()
  {
    if (   !ImageAnnotationEditor_columns || isNaN (ImageAnnotationEditor_columns)
        || ImageAnnotationEditor_columns < 30 || ImageAnnotationEditor_columns > 100) {
      ImageAnnotationEditor_columns = 50;
    }
    this.editor = 
      new LAPI.Edit (
          "" , ImageAnnotationEditor_columns, 6
        , { box      : ImageAnnotator.UI.get ('wpImageAnnotatorEditorLabel', false)
           ,preview  : ImageAnnotator.UI.get ('wpImageAnnotatorPreview', true).capitalizeFirst ()
           ,save     : ImageAnnotator.UI.get ('wpImageAnnotatorSave', true).capitalizeFirst ()
           ,revert   : ImageAnnotator.UI.get ('wpImageAnnotatorRevert', true).capitalizeFirst ()
           ,cancel   : ImageAnnotator.UI.get ('wpImageAnnotatorCancel', true).capitalizeFirst ()
           ,nullsave : ImageAnnotator.UI.get ('wpImageAnnotatorDelete', true).capitalizeFirst ()
           ,post     : ImageAnnotator.UI.get ('wpImageAnnotatorCopyright', false)
          }
        , {
            onsave    : this.save.bind (this)
           ,onpreview : this.onpreview.bind (this)
           ,oncancel  : this.cancel.bind (this)
           ,ongettext : function (text) {
                          if (text == null) return "";
                          text = text.trim ()
                                     .replace (/\{\{(\s*ImageNote(End)?\s*\|)/g, '&#x7B;&#x7B;$1')
                          ;
                          // Guard against people trying to break notes on purpose
                          if (text.length > 0 && typeof (TextCleaner) != 'undefined')
                            text = TextCleaner.sanitizeWikiText (text, true);
                          return text;
                        }
          }
      );
    this.box = LAPI.make ('div');
    this.box.appendChild (this.editor.getView ());
    // Limit the width of the bounding box to the size of the textarea, taking into account the
    // tooltip styles. Do *not* simply append this.box or the editor view, Opera behaves strangely
    // if textboxes were ever hidden through a visibility setting! Use a second throw-away textbox
    // instead.
    var temp = LAPI.make ('div', null, ImageAnnotator.tooltip_styles);
    temp.appendChild (LAPI.make ('textarea', {cols : ImageAnnotationEditor_columns, rows : 6}));
    Object.merge
      ({position: 'absolute', top: '0px', left: '-10000px', visibility: 'hidden'}, temp.style);
    document.body.appendChild (temp);
    // Now we know how wide this textbox will be
    var box_width = temp.offsetWidth;
    LAPI.DOM.removeNode (temp);
    // Note: we need to use a tooltip with a dynamic content creator function here because
    // static content is cloned inside the Tooltip. Cloning on IE loses all attached handlers,
    // and thus the editor's controls wouldn't work anymore. (This is not a problem on FF3,
    // where cloning preserves the handlers.)
    this.tooltip = new Tooltip (
        ImageAnnotator.get_cover ()
      , this.get_editor.bind (this)
      , { activate     : Tooltip.NONE    // We'll always show it explicitly
         ,deactivate   : Tooltip.ESCAPE
         ,close_button : null            // We have a cancel button anyway
         ,mode         : Tooltip.FIXED
         ,anchor       : Tooltip.TOP_LEFT
         ,mouse_offset : {x:10, y: 10, dx:1, dy:1} // Misuse this: fixed offset from view
         ,max_pixels   : (box_width ? box_width + 20 : 0) // + 20 gives some slack
         ,z_index      : 2010 // Above the cover.
         ,open_delay   : 0
         ,hide_delay   : 0
         ,onclose      : this.close_tooltip.bind (this)
        }
      , ImageAnnotator.tooltip_styles
    );
    this.note = null;
    this.visible = false;
  },

  get_editor : function ()
  {
    return this.box;
  },

  editNote : function (note)
  {
    var same_note = (note == this.note);
    this.note = note;
    this.viewer = this.note.viewer;

    var cover    = ImageAnnotator.get_cover ();
    cover.style.cursor = 'auto';
    ImageAnnotator.show_cover ();
    
    if (note.tooltip) note.tooltip.hide_now ();

    if (note.content && !ImageAnnotator.wiki_read) {
      // Existing note, and we don't have the wikitext yet: go get it
      var self = this;
      LAPI.Ajax.apiGet (
          'query'
        , { prop      : 'revisions'
           ,titles    : wgPageName
           ,rvlimit   : 1
           ,rvstartid : wgCurRevisionId
           ,rvprop    : 'ids|content'
          }
        , function (request, json_result) {
            if (json_result && json_result.query && json_result.query.pages) {
              // Should have only one page here
              for (page in json_result.query.pages) {
                var p = json_result.query.pages[page];
                if (p && p.revisions && p.revisions.length > 0) {
                  var rev = p.revisions[0];
                  if (rev.revid == wgCurRevisionId && rev["*"] && rev["*"].length > 0)
                    ImageAnnotator.setWikitext (rev["*"]);
                }
                break;
              }
            }
            // TODO: What upon a failure?
            self.open_editor (same_note, cover);
          }
        , function (request) {
            // TODO: What upon a failure?
            self.open_editor (same_note, cover);
          }
      );
    } else {
      this.open_editor (same_note, cover);
    }
  },

  open_editor : function (same_note, cover)
  {
    this.editor.hidePreview ();
    if (!same_note || this.editor.textarea.readOnly)
      // Different note, or save error last time
      this.editor.setText (this.note.model.wiki);
    this.editor.enable
      (LAPI.Edit.SAVE + LAPI.Edit.PREVIEW + LAPI.Edit.REVERT + LAPI.Edit.CANCEL);
    this.editor.textarea.readOnly = false;
    this.editor.textarea.style.backgroundColor = 'white';
    // Set the position relative to the note's view.
    var view_pos = LAPI.Pos.position (this.note.view);
    var origin   = LAPI.Pos.position (cover);
    this.tooltip.options.fixed_offset.x =
      view_pos.x - origin.x + this.tooltip.options.mouse_offset.x;
    this.tooltip.options.fixed_offset.y =
      view_pos.y - origin.y + this.tooltip.options.mouse_offset.y;
    this.tooltip.options.fixed_offset.dx = 1;
    this.tooltip.options.fixed_offset.dy = 1;
    this.tooltip.show_tip (null, false);
    var tpos = LAPI.Pos.position (this.editor.textarea);
    var ppos = LAPI.Pos.position (this.tooltip.popup);
    tpos = tpos.x - ppos.x;
    if (tpos + this.editor.textarea.offsetWidth > this.tooltip.popup.offsetWidth)
      this.editor.textarea.style.width = (this.tooltip.popup.offsetWidth - 2 * tpos) + 'px';      
    if (LAPI.Browser.is_ie) {
      // Fixate textarea width to prevent ugly flicker on each keypress in IE6...       
      this.editor.textarea.style.width = this.editor.textarea.offsetWidth + 'px';
    }
    this.visible = true;
  },

  hide_editor : function (evt)
  {
    if (!this.visible) return;
    this.visible = false;
    this.tooltip.hide_now (evt);
    if (evt && evt.type == 'keydown' && !this.saving) {
      // ESC pressed on new note before a save attempt
      this.cancel ();
    }
    ImageAnnotator.hide_cover ();
    this.viewer.setDefaultMsg ();
    LAPI.Evt.attach (this.viewer.img, ImageAnnotator.mouse_in, this.viewer.show_evt);
    LAPI.Evt.attach (this.viewer.img, ImageAnnotator.mouse_out, this.viewer.hide_evt);
    this.viewer.show (); // Make sure we get the real views again
  },

  save : function (editor)
  {
    var data = editor.getText ();
    if (!data || data.length == 0) { // Empty text
      this.note.remove (null);
      this.hide_editor ();
      this.cancel ();
      this.note = null;
      return;
    } else if (data == this.note.model.wiki) {
      this.hide_editor ();  // Text unchanged
      this.cancel ();
      return;
    }
    // Construct what to insert
    var dim = Object.clone (this.note.model.dimension);
    if (!dim) {
      dim = { x : Math.round (this.note.view.offsetLeft * this.viewer.factors.dx)
             ,y : Math.round (this.note.view.offsetTop * this.viewer.factors.dy)
             ,w : Math.round (this.note.view.offsetWidth * this.viewer.factors.dx)
             ,h : Math.round (this.note.view.offsetHeight * this.viewer.factors.dy)
            };
      // Make sure everything is within bounds
      if (dim.x + dim.w > this.viewer.full_img.width) {
        if (dim.w > this.note.view.offsetWidth * this.viewer.factors.dx) {
          dim.w--;
          if (dim.x + dim.w > this.viewer.full_img.width) {
            if (dim.x > 0) dim.x--; else dim.w = this.viewer.full_img.width;
          }
        } else {
          // Width already was rounded down
          if (dim.x > 0) dim.x--;
        }
      }
      if (dim.y + dim.h > this.viewer.full_img.height) {
        if (dim.h > this.note.view.offsetHeight * this.viewer.factors.dy) {
          dim.h--;
          if (dim.y + dim.h > this.viewer.full_img.height) {
            if (dim.y > 0) dim.y--; else dim.h = this.viewer.full_img.height;
          }
        } else {
          // Height already was rounded down
          if (dim.y > 0) dim.y--;
        }
      }
      // If still too large, adjust width and height
      if (dim.x + dim.w > this.viewer.full_img.width) {
        if (this.viewer.full_img.width > dim.x) {
          dim.w = this.viewer.full_img.width - dim.x;
        } else {
          dim.x = this.viewer.full_img.width - 1;
          dim.w = 1;
        }
      }
      if (dim.y + dim.h > this.viewer.full_img.height) {
        if (this.viewer.full_img.height > dim.y) {
          dim.h = this.viewer.full_img.height - dim.y;
        } else {
          dim.y = this.viewer.full_img.height - 1;
          dim.h = 1;
        }
      }
    }
    this.to_insert =
        '{{ImageNote'
      + '|id=' + this.note.model.id
      + '|x=' + dim.x + '|y=' + dim.y + '|w=' + dim.w + '|h=' + dim.h
      + '|dimx=' + this.viewer.full_img.width
      + '|dimy=' + this.viewer.full_img.height
      + '|style=2'
      + '}}\n'
      + data + (data.endsWith ('\n') ? "" : '\n')
      + '{{ImageNoteEnd|id=' + this.note.model.id + '}}';
    // Now edit the page
    var self = this;
    this.editor.busy (true);
    this.editor.enable (0); // Disable all buttons
    this.saving = true;
    LAPI.Ajax.editPage (
        wgPageName
      , function (doc, editForm, failureFunc, revision_id)
        {
          try {
            if (revision_id && revision_id != wgCurRevisionId)
              // Page was edited since the user loaded it.
              throw new Error ('#Page version (revision ID) mismatch: edit conflict.');
            
            // Modify the page
            var textbox = editForm.wpTextbox1;
            if (!textbox) throw new Error ('#Server replied with invalid edit page.');
            var pagetext = textbox.value;
            
            ImageAnnotator.setWikitext (pagetext);
            
            var span = null;
            if (self.note.content) // Otherwise it's a new note!
              span = ImageAnnotator.findNote (pagetext, self.note.model.id);
            if (span) { // Replace
              pagetext =
                  pagetext.substring (0, span.start)
                + self.to_insert
                + pagetext.substring (span.end)
                ;
            } else { // If not found, append
              // Try to append right after existing notes
              var lastNote = pagetext.lastIndexOf ('{{ImageNoteEnd|id=');
              if (lastNote >= 0) {
                var endLastNote = pagetext.substring (lastNote).indexOf ('}}');
                if (endLastNote < 0) {
                  endLastNote = pagetext.substring (lastNote).indexOf ('\n');
                  if (endLastNote < 0) lastNote = -1; else lastNote += endLastNote;
                } else
                  lastNote += endLastNote + 2;
              }
              if (lastNote >= 0) {
                pagetext =
                    pagetext.substring (0, lastNote)
                  + '\n' + self.to_insert
                  + pagetext.substring (lastNote)
                  ;
              } else
                pagetext = pagetext.trimRight () + '\n' + self.to_insert;
            }
            textbox.value = pagetext;
            var summary = editForm.wpSummary;
            if (!summary)
              throw new Error ('#Summary field not found. Check that edit pages have valid XHTML.');
            // If [[MediaWiki:Copyrightwarning]] is invalid XHTML, we may not have wpSummary!
            summary.value =
                '[[MediaWiki talk:Gadget-ImageAnnotator.js|'
              + (self.note.content != null ? 'Changing' : 'Adding')
              + ' image note]]: '
              + (data.length > 150 ? data.substring (0, 150) : data).replace ('\n', ' ')
            ;
          } catch (ex) {
            failureFunc (null, ex);
            return;
          }
          var edit_page = doc;
          LAPI.Ajax.submitEdit (
              editForm
            , function (request) {
                // After a successful submit.
                if (edit_page.isFake && (typeof (edit_page.dispose) == 'function'))
                  edit_page.dispose ();
                // TODO: Actually, the edit got through here, so calling failureFunc on
                // inconsistencies isn't quite right. Should we reload the page?
                var id   = 'image_annotation_content_' + self.note.model.id;
                var doc  = LAPI.Ajax.getHTML (request, failureFunc, id);
                if (!doc) return;
                var html = LAPI.$ (id, doc);
                if (!html) {
                  if (doc.isFake && (typeof (doc.dispose) == 'function')) doc.dispose ();
                  failureFunc
                    (request, new Error ('#Note not found after saving. Please reload the page.'));
                  return;
                }
                var revision_id = request.responseText.match (/var wgCurRevisionId = (\d+);/);
                if (revision_id) revision_id = parseInt (revision_id[1]);
                if (!revision_id) {
                  if (doc.isFake && (typeof (doc.dispose) == 'function')) doc.dispose ();
                  failureFunc
                    (request, new Error ('#Version inconsistency after saving. Please reload the page.'));
                  return;
                }
                wgCurRevisionId = revision_id; // Bump revision id!!
                self.note.model.html = LAPI.DOM.importNode (document, html, true);
                if (doc.isFake && (typeof (doc.dispose) == 'function')) doc.dispose ();
                self.note.model.dimension = dim; // record dimension
                self.note.model.html.style.display = "";  
                self.note.model.wiki = data;           
                self.editor.busy (false);
                if (self.note.content) {
                  LAPI.DOM.removeChildren (self.note.content.main);
                  self.note.content.main.appendChild (self.note.model.html);
                } else {
                  // New note.
                  self.note.display (); // Actually a misnomer. Just creates 'content'.
                  if (self.viewer.annotations.length > 1) {
                    self.viewer.annotations.sort (ImageAnnotation.compare);
                    var idxOfNote = Array.indexOf (self.viewer.annotations, self.note);
                    if (idxOfNote+1 < self.viewer.annotations.length)
                      LAPI.DOM.insertNode
                        (self.note.view, self.viewer.annotations [idxOfNote+1].view);
                  }
                }
                self.to_insert = null;
                self.saving = false;
                if (!self.note.tooltip) self.note.setTooltip ();
                self.hide_editor ();
                self.editor.setText (data); // In case the same note is re-opened: start new undo cycle
              }
            , function (request, ex) {
                if (edit_page.isFake && (typeof (edit_page.dispose) == 'function'))
                  edit_page.dispose ();
                failureFunc (request, ex);
              }
          );
        }
      , function (request, ex)
        {
          self.editor.busy (false);
          self.saving = false;
          // TODO: How and where to display error if user closed editor through ESC (or through
          // opening another tooltip) in the meantime?
          if (!self.visible) return;
          // Change the tooltip to show the error.
          self.editor.setText (self.to_insert);
          // Error message. Use preview field for this.
          var error_msg = ImageAnnotator.UI.get ('wpImageAnnotatorSaveError', false);
          if (ex) {
            var ex_msg = LAPI.formatException (ex, true);
            if (ex_msg) {
              ex_msg.style.borderBottom = '1px solid red';
              var tmp = LAPI.make ('div');
              tmp.appendChild (ex_msg);
              tmp.appendChild (error_msg);
              error_msg = tmp;
            }
          }
          self.editor.setPreview (error_msg);
          self.editor.showPreview ();
          self.editor.textarea.readOnly = true;
          // Force a light gray background, since IE has no visual readonly indication.
          self.editor.textarea.style.backgroundColor = '#EEEEEE'; 
          self.editor.enable (LAPI.Edit.CANCEL); // Disable all other buttons
        }
    );
  },

  onpreview : function (editor)
  {
    if (this.tooltip) this.tooltip.size_change ();
  },

  cancel : function (editor)
  {
    if (!this.note) return;
    if (!this.note.content) {
      // No content: Cancel and remove this note!
      this.note.destroy ();
      this.note = null;
    }
    if (editor) this.hide_editor ();
  },

  close_tooltip : function (tooltip, evt)
  {
    this.hide_editor (evt);
    this.cancel ();
  }
  
};

var ImageNotesViewer = function () {this.initialize.apply (this, arguments); };

ImageNotesViewer.prototype =
{
  initialize : function (descriptor)
  {
    this.scope       = descriptor.scope;
    this.file_div    = descriptor.file_div;
    this.img         = descriptor.img;
    this.thumb       = descriptor.thumb;
    this.full_img    = descriptor.full_img;
    this.realName    = descriptor.realName;
    this.annotations = [];
    this.max_id      = 0;
    this.main_div    = null;
    this.msg         = null;

    this.factors =
      { dx : this.full_img.width / this.thumb.width
       ,dy : this.full_img.height / this.thumb.height
      };

    // A div inserted around the image. It ensures that everything we add is positioned properly
    // over the image, even if the browser window size changes and re-layouts occur.
    this.img_div =
      LAPI.make ('div', null, {position: 'relative', width: "" + this.thumb.width + 'px'});
    var floater = 
      LAPI.make (
          'div', null
        , { cssFloat  : (ImageAnnotator.is_rtl ? 'right' : 'left')
           ,styleFloat: (ImageAnnotator.is_rtl ? 'right' : 'left') // For IE...
           ,width     : "" + this.thumb.width + 'px'
           ,position  : 'relative' // Fixes IE layout bugs...
          }
      );
    floater.appendChild (this.img_div);
    this.img.parentNode.parentNode.insertBefore (floater, this.img.parentNode);
    this.img_div.appendChild (this.img.parentNode);
    // And now a clear:left to make the rest appear below the image, as usual.
    var breaker = LAPI.make ('div', null, {clear: (ImageAnnotator.is_rtl ? 'right' : 'left')});
    LAPI.DOM.insertAfter (breaker, floater);
    // Remove spurious br tag.
    if (breaker.nextSibling && breaker.nextSibling.nodeName.toLowerCase () == 'br')
      LAPI.DOM.removeNode (breaker.nextSibling);
    if (LAPI.Browser.is_ie) this.img.alt = "";

    var annotations = getElementsByClassName (this.scope, 'div', ImageAnnotator.annotation_class);
    if (annotations) {
      for (var i = 0; i < annotations.length; i++) {        
        var id = annotations[i].id;
        if (id && /^image_annotation_note_(\d+)$/.test (id)) {
          id = parseInt (id.substring ('image_annotation_note_'.length));
        } else
          id = null;
        if (id) {
          if (id > this.max_id) this.max_id = id;
          var w = ImageAnnotator.getIntItem ('full_width_'  + id, this.scope);
          var h = ImageAnnotator.getIntItem ('full_height_' + id, this.scope);
          if (   w == this.full_img.width && h == this.full_img.height
              && !Array.exists (this.annotations, function (note) {return note.model.id == id;})
             )
          {
            try {
              this.register (new ImageAnnotation (annotations[i], this, id));
            } catch (ex) {
              // Swallow.
            }
          }
        }
      }
    }
    if (this.annotations.length > 1) this.annotations.sort (ImageAnnotation.compare);
    // Add the rectangles of existing notes to the DOM now that they are sorted.
    Array.forEach (this.annotations, (function (note) {this.img_div.appendChild (note.view);}).bind (this));
    this.main_div = LAPI.make ('div');
    if (ImageAnnotator.is_rtl) {
      this.main_div.style.direction = 'rtl';
      this.main_div.className = 'rtl';
    }
    this.msg = LAPI.make ('div', null, {display: 'none'});
    if (ImageAnnotator.is_rtl) {
      this.msg.style.direction = 'rtl';
      this.msg.className = 'rtl';
    }
    this.main_div.appendChild (this.msg);
    LAPI.DOM.insertAfter (this.main_div, this.file_div);
    this.show_evt = LAPI.Evt.makeListener (this, this.show);
    LAPI.Evt.attach (this.img, ImageAnnotator.mouse_in, this.show_evt);
    this.hide_evt = LAPI.Evt.makeListener (this, this.hide);
    LAPI.Evt.attach (this.img, ImageAnnotator.mouse_out, this.hide_evt);
    this.visible = false;
    this.setDefaultMsg ();
  },

  adjustRectangleSize : function (node)
  {
    // Make sure the note boxes don't overlap the image boundary; we might get an event
    // loop otherwise if the mouse was just on that overlapped boundary, resulting in flickering.
    var view_x = node.offsetLeft;
    var view_y = node.offsetTop;
    var view_w = node.offsetWidth;
    var view_h = node.offsetHeight;
    if (view_x == 0) view_x = 1;
    if (view_y == 0) view_y = 1;
    if (view_x + view_w >= this.thumb.width) {
      view_w = this.thumb.width - view_x - 1;
      if (view_w <= 4) { view_w = 4; view_x = this.thumb.width - view_w - 1;}
    }
    if (view_y + view_h >= this.thumb.height) {
      view_h = this.thumb.height - view_y - 1;
      if (view_h <= 4) { view_h = 4; view_y = this.thumb.height - view_h - 1;}
    }
    // Now set position and width and height, subtracting cumulated border widths
    if (   view_x != node.offsetLeft || view_y != node.offsetTop
        || view_w != node.offsetWidth || view_h != node.offsetHeight)
    {
      node.style.top = "" + view_y + 'px';
      node.style.left = "" + view_x + 'px';
      node.style.width = "" + (view_w - 2) + 'px';
      node.style.height = "" + (view_h - 2) + 'px';
      node.firstChild.style.width = "" + (view_w - 4) + 'px';
      node.firstChild.style.height = "" + (view_h - 4) + 'px';
    }
  },

  toggle : function (dummies)
  {
    if (!this.annotations || this.annotations.length == 0) return;
    if (dummies) {
      for (var i = 0; i < this.annotations.length; i++) {
        this.annotations[i].view.style.display = 'none';
        if (this.visible && this.annotations[i].tooltip)
          this.annotations[i].tooltip.hide_now (null);
        this.annotations[i].dummy.style.display = (this.visible ? 'none' : "");
        if (!this.visible) this.adjustRectangleSize (this.annotations[i].dummy);
      }
    } else {
      for (var i = 0; i < this.annotations.length; i++) {
        this.annotations[i].dummy.style.display = 'none';
        this.annotations[i].view.style.display = (this.visible ? 'none' : "");
        if (!this.visible) this.adjustRectangleSize (this.annotations[i].view);
        if (this.visible && this.annotations[i].tooltip)
          this.annotations[i].tooltip.hide_now (null);
      }
    }
    this.visible = !this.visible;
  },
  
  show : function (evt)
  {
    if (this.visible) return;
    this.toggle (ImageAnnotator.is_adding);
  },
  
  hide : function (evt)
  {
    if (!this.visible) return;
    if (evt) {
      var mouse_pos = LAPI.Pos.mousePosition (evt);
      if (mouse_pos) {
        var is_within = LAPI.Pos.isWithin (this.img, mouse_pos.x, mouse_pos.y);
        if (is_within) {
          // Check for annoying boundary cases. Sometimes we get a mouseout event that is just on the
          // boundary.
          var img_pos = LAPI.Pos.position (this.img);
          if (img_pos.x == mouse_pos.x || img_pos.x + this.img.offsetWidth == mouse_pos.x)
            is_within = false;
          if (img_pos.y == mouse_pos.y || img_pos.y + this.img.offsetHeight == mouse_pos.y)
            is_within = false;
          if (is_within) return;
        }
      }
    }
    this.toggle (ImageAnnotator.is_adding);
  },
  
  register : function (new_note)
  {
    this.annotations[this.annotations.length] = new_note;
    if (new_note.model.id > 0) {
      if (new_note.model.id > this.max_id) this.max_id = new_note.model.id;
    } else {
      new_note.model.id = ++this.max_id;
    }
  },
  
  deregister : function (note)
  {
    Array.remove (this.annotations, note);
    if (note.model.id == this.max_id) this.max_id--;
  },
  
  setDefaultMsg : function ()
  {
    if (this.annotations && this.annotations.length > 0) {
      LAPI.DOM.removeChildren (this.msg);
      this.msg.appendChild
        (ImageAnnotator.UI.get ('wpImageAnnotatorHasNotesMsg', false));
      if (this.realName && typeof (this.realName) == 'string' && this.realName.length > 0) {
        var otherPageMsg = ImageAnnotator.UI.get ('wpImageAnnotatorEditNotesMsg', false);
        if (otherPageMsg) {
          var lk = otherPageMsg.getElementsByTagName ('a');
          if (lk && lk.length > 0) {
            lk = lk[0];
            lk.parentNode.replaceChild (
                LAPI.DOM.makeLink (
                    wgArticlePath.replace ('$1', encodeURI (this.realName))
                  , this.realName
                  , this.realName
                )
              , lk
            );
            this.msg.appendChild (otherPageMsg);
          }
        }
      }
      this.msg.style.display = "";
    } else {
      this.msg.style.display = 'none';
    }
    if (ImageAnnotator.button_div) ImageAnnotator.button_div.style.display = "";
  }

};  

// User configurations
if (typeof (ImageAnnotator_zoom_threshold) == 'undefined')
  var ImageAnnotator_zoom_threshold = 8.0;

var ImageAnnotator =
{
  // This object is responsible for setting up annotations when a page is loaded. It loads all
  // annotations in the page source, and adds an "Annotate this image" button plus the support
  // for drawing rectangles onto the image if there is only one image and editing is allowed.
  
  haveAjax      : false,
  
  button_div    : null,
  add_button    : null,
  
  cover         : null,
  border        : null,
  definer       : null,
    
  mouse_in      : (!!window.ActiveXObject ? 'mouseenter' : 'mouseover'),
  mouse_out     : (!!window.ActiveXObject ? 'mouseleave' : 'mouseout'),
  
  annotation_class : 'image_annotation',

  // Format of notes in Wikitext. Note: there are two formats, an old one and a new one.
  // We only write the newest (last) one, but we can read also the older formats. Order is
  // important, because the old format also used the ImageNote template, but for a different
  // purpose.
  note_delim       :
  [
    { start         : '<div id="image_annotation_note_$1"'
     ,end           : '</div><!-- End of annotation $1-->'
     ,content_start : '<div id="image_annotation_content_$1">\n'
     ,content_end   : '</div>\n<span id="image_annotation_wikitext_$1"'
    }
   ,{ start         : '{{ImageNote|id=$1'
     ,end           : '{{ImageNoteEnd|id=$1}}'
     ,content_start : '}}\n'
     ,content_end   : '{{ImageNoteEnd|id=$1}}'
    }
  ],

  tooltip_styles : // The style for all our tooltips
   {  border          : '1px solid #8888aa'
    , backgroundColor : '#ffffe0'
    , padding         : '0.3em'
    , fontSize        : ((skin && (skin == 'monobook' || skin == 'modern')) ? '127%' : '100%')
      // Scale up to default text size
   },

  editor         : null,
  
  wiki_read      : false,
  is_rtl         : false,

  move_listening : false,
  is_tracking    : false,
  is_adding      : false,

  zoom_threshold : 8.0,
  zoom_factor    : 4.0,

  install_attempts     : 0,
  max_install_attempts : 10, // Maximum 5 seconds

  imgs_with_notes : null,

  install : function ()
  {
    if (typeof (ImageAnnotator_disable) != 'undefined' && !!ImageAnnotator_disable) return;
    if (   wgAction && (wgAction == 'view' || wgAction == 'purge')
        && document.URL.search (/[?&]oldid=/) < 0)
    {
      if (wgNamespaceNumber == 6) {
        ImageAnnotator.wait_for_required_libraries ();
      } else {
        ImageAnnotator.imgs_with_notes = getElementsByClassName (document, '*', 'wpImageAnnotatorEnable');
        if (ImageAnnotator.imgs_with_notes && ImageAnnotator.imgs_with_notes.length > 0) {
          ImageAnnotator.wait_for_required_libraries ();
        }
      }
    }
  },

  wait_for_required_libraries : function ()
  {
    if (typeof (Tooltip) == 'undefined' || typeof (LAPI) == 'undefined') {
      if (ImageAnnotator.install_attempts++ < ImageAnnotator.max_install_attempts) {
        window.setTimeout (ImageAnnotator.wait_for_required_libraries, 500); // 0.5 sec.
      }
      return;
    }
    ImageAnnotator.setup ();
  },

  setup: function ()
  {
    if (LAPI.Browser.is_opera && !LAPI.Browser.is_opera_ge_9) return; // Opera 8 has severe problems
    var self = ImageAnnotator;
    self.imgs = [];
    
    function img_check (img)
    {
      return; // added by Brad Neuberg
      var w = img.offsetWidth;
      var h = img.offsetHeight;
      // Don't do anything on extremely small previews. We need some minimum extent to be able to place
      // rectangles after all...
      if (w < 20 || w < 20) return null;
      // Quit if the image wasn't loaded properly for some reason:
      if (   w != parseInt (img.getAttribute ('width'), 10)
          || h != parseInt (img.getAttribute ('height'), 10))
        return null;
      return img;
    }
    
    if (wgNamespaceNumber == 6) {
      if (wgTitle.search (/\.(jpe?g|png|gif|svg)$/i) < 0) return; // Only PNG, JPE?G, GIF, SVG
      var file_div = LAPI.$ ('file');
      if (!file_div) return; // Catch page without file...
      var img = img_check (LAPI.WP.getPreviewImage (wgTitle));
      if (!img) return;
      self.imgs[self.imgs.length] = {scope: document, file_div: file_div, img: img, realName: wgPageName};
    } else {
      function setup_one (scope) {
        var file_div = getElementsByClassName (scope, 'div', 'wpImageAnnotatorFile');
        if (!file_div || file_div.length != 1) return null;
        file_div = file_div[0];
        var img = file_div.getElementsByTagName ('img');
        if (!img || img.length == 0) return null;
        img = img_check (img[0]);
        if (!img || img.parentNode.nodeName.toLowerCase () != 'a') return null;
        if (LAPI.WP.pageFromLink (img.parentNode).search (/\.(jpe?g|png|gif|svg)$/i) < 0)
          return null;  // Only PNG, JPE?G, GIF, SVG
        return {scope: scope, file_div: file_div, img: img, realName: LAPI.WP.pageFromLink (img.parentNode).replace (/ /g, '_')};
      }
      Array.forEach (self.imgs_with_notes,
        function (elem) {
          var desc = setup_one (elem);
          if (desc) self.imgs[self.imgs.length] = desc;
        }
      );
    }
    if (self.imgs.length == 0) return;

    Array.forEach (
        self.imgs
      , function (elem) {elem.thumb = {width : elem.img.offsetWidth, height: elem.img.offsetHeight}; }
    );
    
    // Determine whether we have XmlHttp
    self.haveAjax = (LAPI.Ajax.getRequest () != null);
    
    if (self.imgs.length == 1) {
      self.imgs[0].full_img = LAPI.WP.fullImageSizeFromPage ();
      if (self.imgs[0].full_img.width > 0 && self.imgs[0].full_img.height > 0) {
        self.setup_step_two ();
        return;
      }
    }

    // This script needs Ajax! (Note: if this fails, we just don't do anything.)
    if (self.haveAjax) {
      function build_titles ()
      {
        var result = "";
        Array.forEach (
            self.imgs
          , function (elem) {result = result + (result.length > 0 ? '|' : "") +  elem.realName;}
        );
        return result;
      }
      
      LAPI.Ajax.apiGet (
          'query'
        , { titles : ((wgNamespaceNumber == 6) ? wgPageName : build_titles ())
           ,prop   : 'imageinfo'
           ,iiprop : 'size'
          }
        , function (request, json_result, failureFunc) {
            if (json_result && json_result.query && json_result.query.pages) {
              function get_size (info) {
                if (info.imageinfo && info.imageinfo.length > 0) {
                  var items =
                    Array.select (
                        self.imgs
                      , function (elem) {
                          return elem.realName == info.title.replace (/ /g, '_');
                        }
                    );
                  if (items && items.length > 0) {
                    Array.forEach (
                        items
                      , function (elem) {
                          elem.full_img = { width : info.imageinfo[0].width
                                           ,height: info.imageinfo[0].height};
                        }
                    );
                  }
                }
              }
              for (var page in json_result.query.pages) {
                get_size (json_result.query.pages[page]);
              }
              self.setup_step_two ();
            }
          }
        , function () {}
      );
    }
  },

  setup_step_two : function ()
  {
    var self = ImageAnnotator;

    // Throw out any images for which we miss either the thumbnail or the full image size.
    self.imgs =
      Array.select (
          self.imgs
        , function (elem) {
            return elem.thumb.width > 0 && elem.thumb.height > 0
                   && typeof (elem.full_img) != 'undefined'
                   && elem.full_img.width > 0 && elem.full_img.height > 0
                   && elem.full_img.width >= elem.thumb.width
                   && elem.full_img.height >= elem.thumb.height;
          }
      );    

    if (self.imgs.length == 0) return;
    
    // Catch both native RTL and "faked" RTL through [[MediaWiki:Rtl.js]]
    self.is_rtl       =
         LAPI.DOM.hasClass (document.body, 'rtl')
      || (   LAPI.DOM.currentStyle // Paranoia: added recently, not everyone might have it
          && LAPI.DOM.currentStyle (document.body, 'direction') == 'rtl'
         )
    ;

    // Works only with Ajax (but then, most of this script doesn't work without).
    // Check what this does to load times... If lots of people used this, it might be better to
    // have the UI texts included in some footer as we did on Special:Upload. True, everybody
    // would get the texts, even people not using this, but the texts are small anyway...
    if (self.haveAjax) {
      // Get the UI before continuing
      var ui_page = '{{MediaWiki:ImageAnnotatorTexts';
      if (wgUserLanguage != self.UI.defaultLanguage)
        ui_page = ui_page + '|lang=' + wgUserLanguage;
      ui_page = ui_page + '|live=1}}';
      LAPI.Ajax.parseWikitext (
          ui_page
        , function (html_text, failureFunc) {
            var node = LAPI.make ('div', null, {display: 'none'});
            document.body.appendChild (node);
            try {
              node.innerHTML = html_text;
            } catch (ex) {
              // Swallow. We'll just work with the default UI
            }
            self.complete_setup ();
          }
        , function (request, json_result) {
            self.complete_setup ();
          }
      );
      return;
    }
    // No Ajax, use default UI
    self.complete_setup ();
  },

  complete_setup : function ()
  {
    var self = ImageAnnotator;
    
    // Check edit permissions
    var may_edit =
         self.imgs.length == 1
      && (wgRestrictionEdit.length == 0 || wgUserGroups.join (' ').indexOf ('sysop') >= 0);
    if (!may_edit) {
      may_edit = (   wgRestrictionEdit.length == 1 && wgRestrictionEdit[0] == 'autoconfirmed'
                  && wgUserGroups.join (' ').indexOf ('autoconfirmed') >= 0);
    }
    self.haveAjax = self.haveAjax && may_edit;

    if (self.haveAjax) {
      // Check whether the image is local. Don't allow editing if the file is remote.
      var sharedUpload = getElementsByClassName (document, 'div', 'sharedUploadNotice');
      self.haveAjax = (!sharedUpload || sharedUpload.length == 0);
    }
    if (self.haveAjax && wgNamespaceNumber != 6) {
      // Only allow edits if the stored page name matches the current one.
      var img_page_name =
        getElementsByClassName (self.imgs[0].scope, '*', 'wpImageAnnotatorPageName');
      if (img_page_name && img_page_name.length > 0)
        img_page_name = LAPI.DOM.getInnerText (img_page_name[0]);
      else
        img_page_name = "";
      self.haveAjax = (img_page_name.replace (/ /g, '_') == wgTitle.replace (/ /g, '_'));
    }
    if (!self.haveAjax) {
      // Collect all real names, so that we can link to the page where the notes may be edited.
      Array.forEach (
          self.imgs
        , function (elem) {
            var name = getElementsByClassName (elem.scope, '*', 'wpImageAnnotatorFullName');
            elem.realName = ((name && name.length > 0) ? LAPI.DOM.getInnerText (name[0]) : "");
          }
      );
    } else {
      // Reset all real names to null
      Array.forEach (self.imgs, function (elem) { elem.realName = null; });
    }
    
    // Now create viewers for all images
    self.viewers =
      Array.map (
          self.imgs
        , function (elem) {return new ImageNotesViewer (elem);}
      );

    if (!self.haveAjax) return;

    // Respect user override for zoom, if any
    if (   !isNaN (ImageAnnotator_zoom_threshold)
        && ImageAnnotator_zoom_threshold >= 0.0
       )
    {
      // If somebody sets it to a nonsensical high value, that's his or her problem: there won't be any
      // zooming.
      self.zoom_threshold = ImageAnnotator_zoom_threshold;
    }
    // Adapt zoom threshold for small thumbnails or images with a very lopsided width/height ratio,
    // but only if we *can* zoom at least twice
    if (   self.viewers[0].full_img.width > 300
        && Math.min (self.viewers[0].factors.dx, self.viewers[0].factors.dy) >= 2.0
       )
    {
      if (   self.viewers[0].thumb.width < 400
          || self.viewers[0].thumb.width / self.viewers[0].thumb.height > 2.0
          || self.viewers[0].thumb.height / self.viewers[0].thumb.width > 2.0 
         )
      {
        self.zoom_threshold = 0; // Force zooming
      }
    }

    self.editor = new ImageAnnotationEditor ();
    
    function track (evt) {
      evt = evt || window.event;
      if (self.is_adding) self.update_zoom (evt);
      if (!self.is_tracking) return LAPI.Evt.kill (evt);
      var mouse_pos = LAPI.Pos.mousePosition (evt);      
      if (!LAPI.Pos.isWithin (self.cover, mouse_pos.x, mouse_pos.y)) return;
      var origin    = LAPI.Pos.position (self.cover);
      // Make mouse pos relative to cover
      mouse_pos.x = mouse_pos.x - origin.x;
      mouse_pos.y = mouse_pos.y - origin.y;
      if (mouse_pos.x >= self.base_x) {
        self.definer.style.width = "" + (mouse_pos.x - self.base_x) + 'px';
        self.definer.style.left  = "" + self.base_x + 'px';
      } else {
        self.definer.style.width = "" + (self.base_x - mouse_pos.x) + 'px';
        self.definer.style.left  = "" + mouse_pos.x + 'px';
      }
      if (mouse_pos.y >= self.base_y) {
        self.definer.style.height = "" + (mouse_pos.y - self.base_y) + 'px';
        self.definer.style.top    = "" + self.base_y + 'px';
      } else {
        self.definer.style.height = "" + (self.base_y - mouse_pos.y) + 'px';
        self.definer.style.top    = "" + mouse_pos.y + 'px';
      }
      return LAPI.Evt.kill (evt);
    };

    function pause (evt)
    {
      LAPI.Evt.remove (document, 'mousemove', track, true);
      if (!LAPI.Browser.is_ie && typeof (document.captureEvents) == 'function')
        document.captureEvents (null);
      self.move_listening = false;
    };

    function resume (evt)
    {
      // captureEvents is actually deprecated, but I haven't succeeded to make this work with
      // addEventListener only.
      if ((self.is_tracking || self.is_adding) && !self.move_listening) {
        if (!LAPI.Browser.is_ie && typeof (document.captureEvents) == 'function')
          document.captureEvents (Event.MOUSEMOVE);
        LAPI.Evt.attach (document, 'mousemove', track, true);
        self.move_listening = true;
      }
    };

    function stop_tracking (evt)
    {
      evt = evt || window.event;
      // Check that we're within the image. Note: this check can fail only on IE >= 7, on other
      // browsers, we attach the handler on self.cover and thus we don't even get events outside
      // that range.
      var mouse_pos = LAPI.Pos.mousePosition (evt);      
      if (!LAPI.Pos.isWithin (self.cover, mouse_pos.x, mouse_pos.y)) return;
      if (self.is_tracking) {
        self.is_tracking = false;
        self.is_adding = false;
        // Done.
        pause ();
        if (LAPI.Browser.is_ie) {
          //Trust Microsoft to get everything wrong!
          LAPI.Evt.remove (document, 'mouseup', stop_tracking);
        } else {
          LAPI.Evt.remove (self.cover, 'mouseup', stop_tracking);
        }
        LAPI.Evt.remove (window, 'blur', pause);
        LAPI.Evt.remove (window, 'focus', resume);
        self.cover.style.cursor = 'auto';
        LAPI.DOM.removeNode (self.border);
        LAPI.Evt.remove (self.cover, self.mouse_in, self.update_zoom_evt);
        LAPI.Evt.remove (self.cover, self.mouse_out, self.hide_zoom_evt);
        self.hide_zoom ();
        self.viewers[0].hide (); // Hide all existing boxes
        if (!self.definer || self.definer.offsetWidth <= 0 || self.definer.offsetHeight <= 0) {
          // Nothing: just remove the definer:
          if (self.definer) LAPI.DOM.removeNode (self.definer);
          // Re-attach event handlers
          LAPI.Evt.attach (self.viewers[0].img, self.mouse_in, self.viewers[0].show_evt);
          LAPI.Evt.attach (self.viewers[0].img, self.mouse_out, self.viewers[0].hide_evt);
          self.hide_cover ();
          self.viewers[0].setDefaultMsg ();
          // And make sure we get the real view again
          self.viewers[0].show ();
        } else {
          // We have a div with some extent: remove event capturing and create a new annotation
          var new_note = new ImageAnnotation (self.definer, self.viewers[0], -1);
          self.viewers[0].register (new_note);
          self.editor.editNote (new_note);
        }
        self.definer = null;
      }
      if (evt) return LAPI.Evt.kill (evt);
      return false;
    };
    
    function start_tracking (evt)
    {
      if (!self.is_tracking) {
        self.is_tracking = true;
        evt = evt || window.event;
        // Set the position, size 1
        var mouse_pos = LAPI.Pos.mousePosition (evt);
        var origin    = LAPI.Pos.position (self.cover);
        self.base_x = mouse_pos.x - origin.x;
        self.base_y = mouse_pos.y - origin.y
        Object.merge (
            { left   : "" + self.base_x + 'px'
             ,top    : "" + self.base_y + 'px'
             ,width  : '0px'
             ,height : '0px'
             ,display: ""
            }
          , self.definer.style
        );
        // Set mouse handlers
        LAPI.Evt.remove (self.cover, 'mousedown', start_tracking);
        if (LAPI.Browser.is_ie) {
          LAPI.Evt.attach (document, 'mouseup', stop_tracking); // Doesn't work properly on self.cover...
        } else {
          LAPI.Evt.attach (self.cover, 'mouseup', stop_tracking);
        }
        resume ();
        LAPI.Evt.attach (window, 'blur', pause);
        LAPI.Evt.attach (window, 'focus', resume);
      }
      if (evt) return LAPI.Evt.kill (evt);
      return false;
    };
        
    function add_new (evt)
    {
      self.editor.hide_editor ();
      Tooltips.close ();
      var cover = self.get_cover ();
      cover.style.cursor = 'crosshair';
      self.definer =
        LAPI.make (
            'div', null
           ,{ border     : ImageAnnotation.new_border
             ,display    : 'none'
             ,position   : 'absolute'
             ,top        : '0px'
             ,left       : '0px'
             ,width      : '0px'
             ,height     : '0px'
             ,padding    : '0'
             ,lineHeight : '0px' // IE needs this, even though there are no lines within
             ,fontSize   : '0px' // IE
             ,zIndex     : cover.style.zIndex - 2 // Below the mouse capture div
            }
        );
      self.viewers[0].img_div.appendChild (self.definer);
      // Enter mouse-tracking mode to define extent of view. Mouse cursor is outside of image,
      // hence none of our tooltips are visible.
      self.viewers[0].img_div.appendChild (self.border);
      self.show_cover ();
      self.is_tracking = false;
      self.is_adding   = true;
      LAPI.Evt.attach (cover, 'mousedown', start_tracking);
      resume ();
      self.button_div.style.display = 'none';
      // Remove the event listeners on the image: IE sometimes invokes them even when the image is covered
      LAPI.Evt.remove (self.viewers[0].img, self.mouse_in, self.viewers[0].show_evt);
      LAPI.Evt.remove (self.viewers[0].img, self.mouse_out, self.viewers[0].hide_evt);
      self.viewers[0].show (); // Show all note rectangles (but only the dummies)
      self.update_zoom_evt = LAPI.Evt.makeListener (self, self.update_zoom);
      self.hide_zoom_evt = LAPI.Evt.makeListener (self, self.hide_zoom);
      self.show_zoom ();
      LAPI.Evt.attach (cover, self.mouse_in, self.update_zoom_evt);
      LAPI.Evt.attach (cover, self.mouse_out, self.hide_zoom_evt);
      LAPI.DOM.removeChildren (self.viewers[0].msg);
      self.viewers[0].msg.appendChild
        (self.UI.get ('wpImageAnnotatorDrawRectMsg', false));
      self.viewers[0].msg.style.display = "";
    };
    
    self.button_div = LAPI.make ('div');
    self.viewers[0].main_div.appendChild (self.button_div);
    self.add_button =
      LAPI.DOM.makeButton (
          'ImageAnnotationAddButton'
        , self.UI.get ('wpImageAnnotatorAddButtonText', true)
        , add_new
    );
    var add_plea = self.UI.needs_plea;
    self.button_div.appendChild (self.add_button); 
    self.help_link = self.createHelpLink ();
    if (self.help_link) {
      self.button_div.appendChild (document.createTextNode ('\xa0'));
      self.button_div.appendChild (self.help_link);
    }
    if (add_plea && wgServer.contains ('/commons'))
      self.button_div.appendChild (self.UI.get_plea ());
  },
  
  show_zoom : function ()
  {
    var self = ImageAnnotator;
    if (   (   self.viewers[0].factors.dx < self.zoom_threshold
            && self.viewers[0].factors.dy < self.zoom_threshold
           )
        || Math.max (self.viewers[0].factors.dx, self.viewers[0].factors.dy) < 2.0
       )
    {
      // Below zoom threshold, or full image not even twice the size of the preview
      return;
    }
    if (!self.zoom) {
      self.zoom =
        LAPI.make (
            'div'
          , {id : 'image_annotator_zoom'}
          , { overflow        : 'hidden'
             ,width           : '200px'
             ,height          : '200px'
             ,position        : 'absolute'
             ,display         : 'none'
             ,top             : '0px'
             ,left            : '0px'
             ,border          : '2px solid #666666'
             ,backgroundColor : 'white'
             ,zIndex          : 2050 // On top of everything
            }
        );
      var src = self.viewers[0].img.getAttribute ('src', 2);
      // Adjust zoom_factor
      if (self.zoom_factor > self.viewers[0].factors.dx || self.zoom_factor > self.viewers[0].factors.dy)
        self.zoom_factor = Math.min (self.viewers[0].factors.dx, self.viewers[0].factors.dy);
      self.zoom.appendChild (LAPI.make ('div', null, {position : 'relative'}));
      // Calculate zoom size and source link
      var zoom_width  = Math.floor (self.viewers[0].thumb.width * self.zoom_factor);
      var zoom_height = Math.floor (self.viewers[0].thumb.height * self.zoom_factor);
      var zoom_src   = null;
      // For SVGs, always use a scaled PNG for the zoom.
      if (zoom_width < 0.9 * self.viewers[0].full_img.width || src.search (/\.svg\.png$/i) >= 0) {
        var i = src.lastIndexOf ('/');
        if (i >= 0) {
          zoom_src = src.substring (0, i)
                   + src.substring (i).replace (/^\/\d+px-/, '/' + zoom_width + 'px-');
        }
      } else {
        // If the thumb we'd be loading was within about 80% of the full image size, we may just as
        // well get the full image instead of a scaled version.
        self.zoom_factor = Math.min (self.viewers[0].factors.dx, self.viewers[0].factors.dy);
        zoom_width       = self.viewers[0].full_img.width;
        zoom_height      = self.viewers[0].full_img.height;
        zoom_src         = self.viewers[0].img.parentNode.getAttribute ('href', 2);
      }
      // Construct the initial zoomed image. We need to clone; if we create a completely
      // new DOM node ourselves, it may not work on IE6...
      var zoomed = self.viewers[0].img.cloneNode (true);
      zoomed.width = "" + zoom_width;
      zoomed.height = "" + zoom_height;
      Object.merge ({position: 'absolute', top: '0px',left: '0px'}, zoomed.style);
      self.zoom.firstChild.appendChild (zoomed);
      // Crosshair
      self.zoom.firstChild.appendChild (
        LAPI.make (
            'div', null
          , { width      : '1px'
             ,height     : '200px'
             ,borderLeft : '1px solid red'
             ,position   : 'absolute'
             ,top        : '0px'
             ,left       : '100px'
            }
        )
      );
      self.zoom.firstChild.appendChild (
        LAPI.make (
            'div', null
          , { width     : '200px'
             ,height    : '1px'
             ,borderTop : '1px solid red'
             ,position  : 'absolute'
             ,top       : '100px'
             ,left      : '0px'
            }
        )
      );
      document.body.appendChild (self.zoom);
      if (zoom_src) {
        var zoom_loader =
          LAPI.make (
              'img'
            , {width : "" + zoom_width, height: "" + zoom_height, src: zoom_src}
            , {position: 'absolute', top: '0px', left: '0px', display: 'none'}
          );
        LAPI.Evt.attach (
            zoom_loader, 'load'
          , function () {
              // Replace the image in self.zoom by self.zoom_loader, making sure we keep the offsets
              zoom_loader.style.top = self.zoom.firstChild.firstChild.style.top;
              zoom_loader.style.left = self.zoom.firstChild.firstChild.style.left;
              zoom_loader.style.display = "";
              self.zoom.firstChild.replaceChild (zoom_loader, self.zoom.firstChild.firstChild);
            }
        );
        document.body.appendChild (zoom_loader); // Now the browser goes loading the larger image
      }
    }
    self.zoom.style.display = 'none'; // Will be shown in update
  },

  update_zoom : function (evt)
  {
    if (!evt) return; // We need an event to calculate positions!
    var self = ImageAnnotator;
    if (!self.zoom) return;
    var mouse_pos = LAPI.Pos.mousePosition (evt);
    var origin    = LAPI.Pos.position (self.cover);
    if (!LAPI.Pos.isWithin (self.cover, mouse_pos.x, mouse_pos.y)) {
      ImageAnnotator.hide_zoom ();
      return;
    }
    var dx = mouse_pos.x - origin.x;
    var dy = mouse_pos.y - origin.y;
    // dx, dy is the offset within the preview image. Align the zoom image accordingly.
    var top  = - dy * self.zoom_factor + 100;
    var left = - dx * self.zoom_factor + 100;
    self.zoom.firstChild.firstChild.style.top  = "" + top  + 'px';
    self.zoom.firstChild.firstChild.style.left = "" + left + 'px';
    self.zoom.style.top  = mouse_pos.y + 10 + 'px'; // Right below the mouse pointer
    // Horizontally keep it in view.
    var x = (self.is_rtl ? mouse_pos.x - 10 : mouse_pos.x + 10);
    if (x < 0) x = 0;
    self.zoom.style.left = x + 'px';
    self.zoom.style.display = "";
    // Now that we have offsetWidth, correct the position.
    if (self.is_rtl) {
      x = mouse_pos.x - 10 - self.zoom.offsetWidth;
      if (x < 0) x = 0;
    } else {
      var off  = LAPI.Pos.scrollOffset ();
      var view = LAPI.Pos.viewport ();
      if (x + self.zoom.offsetWidth > off.x + view.x) x = off.x + view.x - self.zoom.offsetWidth;
      if (x < 0) x = 0;
    }
    self.zoom.style.left = x + 'px';
  },

  hide_zoom : function (evt)
  {
    if (!ImageAnnotator.zoom) return;
    if (evt) {
      var mouse_pos = LAPI.Pos.mousePosition (evt);
      if (LAPI.Pos.isWithin (ImageAnnotator.cover, mouse_pos.x, mouse_pos.y)) return;
    }
    ImageAnnotator.zoom.style.display = 'none';
  },

  createHelpLink : function ()
  {
    var msg = ImageAnnotator.UI.get ('wpImageAnnotatorHelp', false, true);
    if (!msg || !msg.lastChild) return null;
    if (   msg.childNodes.length == 1
        && msg.firstChild.nodeName.toLowerCase () == 'a'
        && !LAPI.DOM.hasClass (msg.firstChild, 'image')
       ) {
      msg.firstChild.id = 'ImageAnnotationHelpButton';
      return msg.firstChild; // Single link
    }
    // Otherwise, it's either a sequence of up to three images, or a span, followed by a
    // link.
    var tgt  = msg.lastChild;
    if (tgt.nodeName.toLowerCase () != 'a')
      tgt = wgServer + wgArticlePath.replace ('$1', 'Help:Gadget-ImageAnnotator');
    else
      tgt = tgt.href;
    
    function make_handler (tgt) {
      var target = tgt;
      return function (evt) {
               var e = evt || window.event;
               window.location = target;
               if (e) return LAPI.Evt.kill (e);
               return false;
             };
    }

    var imgs = msg.getElementsByTagName ('img');
    
    if (!imgs || imgs.length == 0) {
      // We're supposed to have a spans giving the button text
      var text = msg.firstChild;
      if (text.nodeName.toLowerCase () == 'span')
        text = LAPI.DOM.getInnerText (text);
      else
        text = 'Help';
      return LAPI.DOM.makeButton (
                 'ImageAnnotationHelpButton'
               , text
               , make_handler (tgt)
             );
    } else {
      return Buttons.makeButton (imgs, 'ImageAnnotationHelpButton', make_handler (tgt));
    }
  },

  get_cover : function ()
  {
    var self = ImageAnnotator;
    if (!self.cover) {
      var pos = { position : 'absolute'
                 ,left     : '0px'
                 ,top      : '0px'
                 ,width    : self.viewers[0].thumb.width + 'px'
                 ,height   : self.viewers[0].thumb.height + 'px'
                };
      self.cover = LAPI.make ('div', null, pos);
      self.border = self.cover.cloneNode (false);
      Object.merge (
          {border: '3px solid green', top: '-3px', left: '-3px'}, self.border.style);
      self.cover.style.zIndex   = 2000;       // Above the tooltips
      if (LAPI.Browser.is_ie) {
        var shim = LAPI.make ('iframe', {frameBorder: 0, tabIndex: -1}, pos);
        shim.style.filter   = 'alpha(Opacity=0)'; // Ensure transparency
        // Unfortunately, IE6/SP2 has a "security setting" called "Binary and script
        // behaviors". If that is disabled, filters don't work, and our iframe would
        // appear as a white rectangle. Fix this by first placing the iframe just above
        // image (to block that windowed control) and then placing *another div* just
        // above that shim having the image as its background image.
        var imgZ = self.viewers[0].img.style.zIndex;
        if (isNaN (imgZ)) imgZ = 10; // Arbitrary, positive, > 1, < 500
        shim.style.zIndex   = imgZ + 1;
        self.ieFix = shim;
        // And now the bgImage div...
        shim = LAPI.make ('div', null, pos);
        Object.merge (
            { top            : '1px' // Fix strange 1px jog on IE6...
             ,backgroundImage: 'url(' + self.viewers[0].img.src + ')'
             ,zIndex         : imgZ + 2
            }
          , shim.style
        );
        self.ieFix2 = shim;
      }
      if (LAPI.Browser.is_opera) {
        // It appears that events just pass through completely transparent divs on Opera.
        // Hence we have to ensure that these events are killed even if our cover doesn't
        // handle them.
        var shim = LAPI.make ('div', null, pos);
        shim.style.zIndex = self.cover.style.zIndex - 1;
        LAPI.Evt.attach (shim, 'mousemove',
          function (evt) {return LAPI.Evt.kill (evt || window.event);});
        LAPI.Evt.attach (shim, 'mousedown',
          function (evt) {return LAPI.Evt.kill (evt || window.event);});
        LAPI.Evt.attach (shim, 'mouseup',
          function (evt) {return LAPI.Evt.kill (evt || window.event);});
        shim.style.cursor = 'default';
        self.eventFix = shim;
      }
      self.cover_visible = false;
    }
    return self.cover;
  },
  
  show_cover : function ()
  {
    var self = ImageAnnotator;
    if (self.cover && !self.cover_visible) {
      if (self.ieFix) {
        self.viewers[0].img_div.appendChild (self.ieFix);
        self.viewers[0].img_div.appendChild (self.ieFix2);
      }
      if (self.eventFix) self.viewers[0].img_div.appendChild (self.eventFix);
      self.viewers[0].img_div.appendChild (self.cover);
      self.cover_visible = true;
    }
  },

  hide_cover : function ()
  {
    var self = ImageAnnotator;
    if (self.cover && self.cover_visible) {
      if (self.ieFix) {
        LAPI.DOM.removeNode (self.ieFix);
        LAPI.DOM.removeNode (self.ieFix2);
      }
      if (self.eventFix) LAPI.DOM.removeNode (self.eventFix);
      LAPI.DOM.removeNode (self.cover);
      self.cover_visible = false;
    }
  },

  getRawItem : function (what, scope)
  {
    var node = null;
    if (!scope || scope == document) {
      node = LAPI.$ ('image_annotation_' + what);
    } else {
      node = getElementsByClassName (scope, '*', 'image_annotation_' + what);
      if (node && node.length > 0) node = node[0]; else node = null;
    }
    return node;
  },

  getItem : function (what, scope)
  {
    var node = ImageAnnotator.getRawItem (what, scope);
    if (!node) return null;
    return LAPI.DOM.getInnerText (node).trim();
  },
  
  getIntItem : function (what, scope)
  {
    var x = ImageAnnotator.getItem (what, scope);
    if (x !== null) x = parseInt (x, 10);
    return x;
  },

  findNote : function (text, id)
  {
    function find (text, id, delim) {
      var start = delim.start.replace ('$1', id);
      var start_match = text.indexOf (start);
      if (start_match < 0) return null;
      var end = delim.end.replace ('$1', id);
      var end_match = text.indexOf (end);
      if (end_match < start_match + start.length) return null;
      return {start: start_match, end: end_match + end.length};  
    }

    var result = null;
    for (var i=0; i < ImageAnnotator.note_delim.length && !result; i++) {
      result = find (text, id, ImageAnnotator.note_delim[i]);
    }
    return result;
  },

  setWikitext : function (pagetext)
  {
    var self = ImageAnnotator;
    if (self.wiki_read) return;
    Array.forEach (self.viewers[0].annotations,
      function (note) {
        if (note.model.id >= 0) {
          var span = self.findNote (pagetext, note.model.id)
          if (!span) return;
          // Now extract the wikitext
          var code = pagetext.substring (span.start, span.end);
          for (var i = 0; i < self.note_delim.length; i++) {
            var start = self.note_delim[i].content_start.replace ('$1', note.model.id);
            var end   = self.note_delim[i].content_end.replace ('$1', note.model.id);
            var j = code.indexOf (start);
            var k = code.indexOf (end);
            if (j >= 0 && k >= 0 && k >= j + start.length) {
              note.model.wiki = code.substring (j + start.length, k);
              return;
            }
          }
        }
      }
    );
    self.wiki_read = true;
  },

  UI : {
    defaultLanguage : ImageAnnotator_DefaultLanguage,

    defaults: {
       wpImageAnnotatorDelete        : 'Delete note'
      ,wpImageAnnotatorEdit          : 'Edit'
      ,wpImageAnnotatorSave          : 'Save'
      ,wpImageAnnotatorCancel        : 'Cancel'
      ,wpImageAnnotatorPreview       : 'Preview'
      ,wpImageAnnotatorRevert        : 'Revert'
      ,wpTranslate                   : 'translate'
      ,wpImageAnnotatorAddButtonText : 'Add a note'
      ,wpImageAnnotatorHasNotesMsg   :
         'This file has annotations. Move the mouse pointer over the image to see them.'
      ,wpImageAnnotatorEditNotesMsg  :
         '\xa0To edit the notes, visit page <a href="#">x</a>.'
      ,wpImageAnnotatorDrawRectMsg   :
         'Draw a rectangle onto the image above (mouse click, then drag and release)'
      ,wpImageAnnotatorEditorLabel   :
         '<span>Text of the note (may include '
       + '<a href="http://meta.wikimedia.org/wiki/Help:Reference_card">Wiki markup</a>)</span>'
      ,wpImageAnnotatorSaveErrorMsg  :
         '<span><span style="color:red;">'
       + 'Could not save your note (edit conflict or other problem).'
       + '</span> '
       + 'Please copy the text in the edit box below and insert it manually by '
       + '<a href="'
       + wgArticlePath.replace ('$1', encodeURI (wgPageName))
       + '?action=edit">editing this page</a>.</span>'
      ,wpImageAnnotatorCopyright :
         '<small>The note will be published multi-licensed as '
       + '<a href="http://creativecommons.org/licenses/by-sa/3.0/">CC-BY-SA-3.0</a> and '
       + '<a href="http://www.gnu.org/copyleft/fdl.html">GFDL</a>, versions 1.2 and 1.3.'
       + '</small>'
      ,wpImageAnnotatorDeleteConfirm :
         'Are you sure you really want to delete this note?'
      ,wpImageAnnotatorHelp          : 
         '<span><a href="http://commons.wikimedia.org/wiki/Help:Gadget-ImageAnnotator" '
       + 'title="Help">Help</a></span>'
    },

    repo       : null,
    needs_plea : false,

    setup : function ()
    {
      if (ImageAnnotator.UI.repo) return;
      var self = ImageAnnotator.UI;
      var node = LAPI.make ('div', null, {display: 'none'});
      document.body.appendChild (node);
      if (typeof (UIElements) == 'undefined') {
        self.basic = true;
        self.repo = {};
        for (var item in self.defaults) {
          node.innerHTML = self.defaults[item];
          self.repo[item] = node.firstChild;
          LAPI.DOM.removeChildren (node);
        }
      } else {
        self.basic = false;
        self.repo = UIElements.emptyRepository (self.defaultLanguage);
        for (var item in self.defaults) {
          node.innerHTML = self.defaults[item];
          UIElements.setEntry (item, self.repo, node.firstChild);
          LAPI.DOM.removeChildren (node);
        }
        UIElements.load ('wpImageAnnotatorTexts', null, null, self.repo);
      }
      LAPI.DOM.removeNode (node);      
    },

    get : function (id, basic, no_plea)
    {
      var self = ImageAnnotator.UI;
      if (!self.repo) ImageAnnotator.UI.setup ();
      var result   = null;
      var add_plea = false;
      if (self.basic) {
        result = self.repo[id];   
      } else {
        result = UIElements.getEntry (id, self.repo, wgUserLanguage, null);
        add_plea = !result;
        if (!result) result = UIElements.getEntry (id, self.repo);
      }
      self.needs_plea = add_plea;
      if (!result) return null; // Hmmm... what happened here? We normally have defaults...
      if (basic) return LAPI.DOM.getInnerText (result).trim ();
      result = result.cloneNode (true);
      if (wgServer.contains ('/commons') && add_plea && !no_plea) {
        // Add a translation plea.
        if (result.nodeName.toLowerCase () == 'div') {
          result.appendChild (self.get_plea ());
        } else {
          var span = LAPI.make ('span');
          span.appendChild (result);
          span.appendChild (self.get_plea ());
          result = span;
        }
      }
      return result;
    },

    get_plea : function ()
    {
      var self = ImageAnnotator.UI;
      var translate = self.get ('wpTranslate', false, true) || 'translate';
      var span = LAPI.make ('small');
      span.appendChild (document.createTextNode ('\xa0('));
      span.appendChild (
        LAPI.DOM.makeLink (
              wgServer + wgScript + '?title=MediaWiki_talk:ImageAnnotatorTexts'
            + '&action=edit&section=new&withJS=MediaWiki:ImageAnnotatorTranslator.js'
            + '&language=' + wgUserLanguage
          , translate
          , (typeof (translate) == 'string' ? translate : LAPI.DOM.getInnerText (translate).trim ())
        )
      );
      span.appendChild (document.createTextNode (')'));
      return span;
    }

  } // end UI

}; // end ImageAnnotator

hookEvent ('load', ImageAnnotator.install);

} // end if (guard against double inclusions)

// </source>