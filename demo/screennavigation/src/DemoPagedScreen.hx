package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.minimalcomp.Component;
import com.pblabs.components.minimalcomp.Container;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.ImageTools;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.ui.BoxPanelImage;
import com.pblabs.components.ui.ScreenTransitions;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.Source;
import com.pblabs.engine.resource.SvgResources;
import org.transition9.util.svg.SvgReplace;

using Lambda;

using StringTools;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.minimalcomp.MCompTools;
using com.pblabs.components.scene2D.HierarchyManager;
using com.pblabs.components.scene2D.ImageTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.components.ui.InputButtonOverlay;
using com.pblabs.components.util.ResetCallbacks;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using org.transition9.util.StringUtil;

class DemoPagedScreen extends com.pblabs.components.ui.PagedScreen
{
	static var CONTEXT :Int = 1;
	var _contextVbox :IEntity;
	
	public function new ()
	{
		super();
		name = titleLabel = "Screen " + (CONTEXT++);
	}
	
	override function setup () :Void
	{
		trace('Resources.list.BUTTON_ICON_LEFT=' + Resources.list.BUTTON_ICON_LEFT);
		trace('Resources.all.get("BUTTON_ICON_LEFT")=' + Resources.all.get("BUTTON_ICON_LEFT"));
		
		super.setup();
		addSingletonComponent(com.pblabs.components.ui.InputButtonOverlay);
		
		ensureManager(com.pblabs.components.scene2D.HierarchyManager);
		
		//Setup the context buttons
		var topCenter = _layerForeground.scene.getAlignedPoint(SceneAlignment.TOP_CENTER);
		topCenter.y += 200;
		_contextVbox = createVBox(_layerForeground)
			.addSceneComponent(BoxPanelImage, _layerForeground)
			.setLocation(topCenter.x, topCenter.y);

		_contextVbox.getComponent(BoxPanelImage).lineColor = 0x000000;
		_contextVbox.getComponent(BoxPanelImage).dividerLineWidth = 0.5;
			
		var game = getManager(PBGame);
		var jobs :Array<Dynamic> = [
			"Push context", callback(game.pushContext, DemoPagedScreen, ScreenTransitions.scrollForward),
			"Pop context", function () :Void {
				if (game.contexts.length > 1) {
					game.popContext(ScreenTransitions.scrollBack);
				}
			}
		];
		
		var ii = 0;
		while (jobs.length > 0) {
			var label :String = jobs.shift();
			var cb :Void->Void = jobs.shift();
			
			var randId = Std.int(Math.random() * 100000);
			
			//Button
			var button = createBaseSceneEntity()
				.addSvg(_layerForeground, Resources.list.BUTTON_ICON_LEFT, null, "c1", true)
				.setOnClick(cb)
				.addToComponentParent(_contextVbox)
				.invalidateOnOrientationChange()
				.showOverlay()
				.stretchToWidth(0.8)
				.initializeEntity("buttonIconLeft");
			
			//Button icon
			var icon = createBaseSceneEntity()
				.addSceneComponent(CircleShape, _layerForeground)
				.initializeEntity("icon")
				.setEntityAsDisplayChildOf(button, Resources.list.BUTTON_ICON_LEFT, "anchor1");
			icon.getComponent(BaseSceneComponent).objectMask = ObjectType.NONE;
			
			
			//Text icon
			var text = createBaseSceneEntity()
				// .addSvg(_layerForeground, Resources.list.TEXT_LEFT,
				// 	[
				// 		new SvgReplace("$replace", label),
				// 	], 
				// 	"c1", false)
				.addText(_layerForeground, label)
				.initializeEntity("icon")
				.setEntityAsDisplayChildOf(button, Resources.list.BUTTON_ICON_LEFT, "anchor2");
			text.getComponent(BaseSceneComponent).objectMask = ObjectType.NONE;
			var regPoint = text.getComponent(BaseSceneComponent).registrationPoint;
			
			text.getComponent(BaseSceneComponent).registrationPoint = new Vec2(0, regPoint.y);
				
			ii += 2;
		}
		
		// haxe.Timer.delay(_contextVbox.getComponent(Component).invalidate, 2000);
		
		#if flash
		//Prevent flicker
		_layerForeground.scene.update();
		#end
		
	}
	
	override function createBackButton () :Void
	{
		if (_backButton != null) {
			_backButton.destroy();
			_backButton = null;
		}

		var topLeft = _layerForeground.scene.getAlignedPoint(SceneAlignment.TOP_LEFT);
		
		var text = getBackButtonText();
		
		if (text.isBlank()) {
			return;	
		}
		
		_backButton = createBaseSceneEntity()
			.addSvg(_layerForeground, Resources.list.BUTTON_BACK, [new SvgReplace("$T", text)], "c1", false)
			.addSvg(_layerForeground, Resources.list.BUTTON_BACK_DOWN, [new SvgReplace("$T", text)], "c2", false, true)
			.makeTwoStateButton()
			.setOnClick(callback(getManager(PBGame).popContext, ScreenTransitions.scrollBack))
			//You have to async set the location, because we may not know the width and height immediately.
			.addResetCallback(function (e :IEntity) :Void {
				if (e.ensureComponent(Component).isRegistered) {
					e.ensureComponent(Component).bindSignal(e.ensureComponent(Component).redrawSignal, function (c :Component) :Void {
						// trace('e.getWidth()=' + e.getWidth());
						if (e.getWidth() > 1) {
							e.setLocation(topLeft.x + e.getWidth() / 2 + 10, topLeft.y + e.getHeight() / 2 + 8);
						}
					});
				}
			})
			.initializeEntity("backButton");
	}
	
	override function setTitle () :Void
	{
		//Vbox for aligning components
		var vboxBackground = createVBox(_layerBackground)
			.setSceneAlignment(SceneAlignment.TOP_CENTER, _layerBackground);
			
		var vboxForeground = createVBox(_layerForeground)
			.setSceneAlignment(SceneAlignment.TOP_CENTER, _layerForeground);
			
		if (_titlePanel != null) {
			_titlePanel.destroy();
			_titlePanel = null;
		}
		
		_titlePanel = createBaseSceneEntity()
			.addToComponentParent(vboxBackground)
			.addSvg(_layerBackground, Resources.list.TITLEBAR, [new SvgReplace("$T", "")], null, false)
			.stretchToWidth()
			// onRedraw(callback(ImageTools.stretchToWidth(_titlePanel, 1.0)))
			// .addResetCallback(function (e :IEntity) :Void {
			// 	if (e.ensureComponent(Component).isRegistered) {
			// 		e.ensureComponent(Component).bindSignal(e.ensureComponent(Component).redrawSignal, function (c :Component) :Void {
			// 			trace('e.getWidth()=' + e.getWidth());
			// 			e.setLocation(topLeft.x + e.getWidth() / 2 + 10, topLeft.y + e.getHeight() / 2 + 8);
			// 		});
			// 	}
			// })
			.initializeEntity("titlebar");
		// _titlePanel.getComponent(com.pblabs.components.scene2D.BaseSceneComponent).width = 60;
		_titlePanel.getComponent(com.pblabs.components.scene2D.BaseSceneComponent).scaleX = 0.1;
		
		var titleText = createBaseSceneEntity()
			.addSvg(_layerForeground, Resources.list.TEXT_TITLE, 
				[
					new SvgReplace("$T", titleLabel),
					
				], null, false)
			.addToComponentParent(vboxForeground)
			// .setXToScreenProportion(0.5)
			.initializeEntity("titletext");
	}
}
