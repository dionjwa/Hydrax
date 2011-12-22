package ;

import com.pblabs.components.input.InputManager;
import com.pblabs.components.input.MouseInputManager;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BitmapRenderer;
import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.RectangleShape;
import com.pblabs.components.scene2D.SceneAlignment;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.scene2D.body.BodySpriteList;
import com.pblabs.components.scene2D.body.SpriteSheetBody;
import com.pblabs.components.scene2D.spritesheet.SpriteListComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.FunctionTask;
import com.pblabs.components.tasks.RepeatingTask;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.core.PBGame;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ImageResources;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;

import de.polygonal.motor.geom.math.Vec2;

import org.transition9.util.Comparators;
import org.transition9.util.Rand;

import haxe.Resource;

import com.pblabs.components.physics.ShapeType;
import com.pblabs.components.physics.box2d.PhysicsComponent;
import com.pblabs.components.physics.box2d.PhysicsManager;

using Lambda;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.tasks.TaskUtil;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.engine.core.PBGameUtil;
using org.transition9.geom.Vec2Tools;
using org.transition9.util.BitmapUtil;

class Demo 
{
	public function new() 
	{
		//General setup
		com.pblabs.engine.debug.Log.setup();
		game = new PBGame();
		game.addBaseManagers();
		
		Resources.init();
		var rsrc = game.getManager(IResourceManager);
		rsrc.addResource(game.allocate(ImageResources));
		
		for (imageToken in Resources.all) {
			rsrc.add(imageToken);
		}
		game.getManager(IResourceManager).load(startGame, function (e :Dynamic) {trace("Error loading: " + e);});
	}
	
	function startGame () :Void
	{
		var rsrc = game.getManager(IResourceManager);
		
		var context :PBContext = game.pushContext(PBContext);
		
		//Scene for game elements
		var gamescene = context.createBaseScene();
		gamescene.sceneAlignment = SceneAlignment.CENTER;
		var layer = gamescene.addLayer(SceneUtil.DEFAULT_LAYER_NAME);
		
		//Scene for the UI
		var uiscene = context.createBaseScene("UIScene");
		uiscene.sceneAlignment = SceneAlignment.TOP_LEFT;
		var uilayer = uiscene.addLayer("uilayer");
		
		//Physics
		var physicsManager = createPhysicsWorld(layer);
		
		//The sprite sheet images need to be sorted
		var getTokensStartingWith = function (prefix :String) :Array<ResourceToken> {
			var resourceTokens = Resources.all.filter(function (t :ResourceToken) :Bool {
				return StringTools.startsWith(t.id, prefix);
			}).array();
			resourceTokens.sort(function (t1 :ResourceToken, t2 :ResourceToken) :Int {
				return Comparators.compareStrings(t1.id, t2.id);
			});
			return resourceTokens;
		}
		
		//Function for creating the sprite lists for the animated body
		var createSpriteList = function (id :String, prefix :String) :BodySpriteList {
			var spritelist = new BodySpriteList(id);
			var tokens = getTokensStartingWith(prefix);
			for (token in tokens) {
				var image = rsrc.get(token);
				org.transition9.util.Assert.isNotNull(image, ' image is null');
				#if flash
				var imageData = image.bitmapData;
				spritelist.imageData.push(imageData);
				spritelist.centers.push(new Vec2(imageData.width / 2, imageData.height / 2));
				#elseif js
				var imageData = org.transition9.util.BitmapUtil.toCanvas(image);
				spritelist.imageData.push(imageData);
				spritelist.centers.push(new Vec2(imageData.width / 2, imageData.height / 2));
				#end
			}
			return spritelist;
		}
		
		//Create the bitmap caches
		var warriorIdle = createSpriteList("idle", "SKELETONS_WARRIOR_S_W_IDLE_S_W_IDLE");
		var attack2 = createSpriteList("attack2", "SKELETONS_WARRIOR_S_W_SW_ATTACK_02_S_W_SW_ATTACK_02");
		
		var radius = 30;
		var circleShapeType = ShapeType.CIRCLE(radius, new ShapeDefinition(8, 0.9, 0.01));
		
		Rand.seedStream(0,37);
		Rand.seedStream(1, 37);
		
		//Create a bunch of skeletons with a sprite sheet body,
		//and a physics bit that will bounce around.
		//When the skeleton hits another in front of it, it will play an attack animation
		for (ii in -4...4) {
			
			//Create the sprite sheet body entity.
			var e = context.createEntity()
				.addComponentToEntity(PhysicsComponent, SpatialComponent.NAME);
			
			var ss = context.allocate(SpriteSheetBody);
			ss.spriteSheets.push(warriorIdle);
			ss.spriteSheets.push(attack2);
			ss.bitmapData = warriorIdle.imageData[0];
			ss.parentProperty = layer.entityProp();
			ss.angleOffset = -Math.PI / 2;
			e.addComponent(ss);
			
			e.initializeEntity("skeleton");
			e.getComponent(PhysicsComponent).shapeType = circleShapeType;
			
			e.setLocation(ii * (radius + 20), ii * (radius + 20));
			e.getComponent(PhysicsComponent).angle = Rand.nextFloatInRange(-Math.PI, Math.PI); 
					
			e.getComponent(PhysicsComponent).applyForce(
				physicsManager.m_physScale *Rand.nextFloatInRange(-100, 100),
				physicsManager.m_physScale *Rand.nextFloatInRange(-100, 100));
			e.getComponent(PhysicsComponent).angularFriction = 0.1;
			
			//Change to a state
			ss.changeToState(warriorIdle.spriteSheetId);
		}
		
		var checkContact = function (e1 :IEntity, e2 :IEntity) :Void {
			//Is 2 on front of 1?
			var loc1 = e1.getComponent(SpatialComponent);
			var loc2 = e2.getComponent(SpatialComponent);
			var angle = loc1.point.calcAngle(loc2.point);
			if (Math.abs(e1.getAngle().differenceAngles(angle)) < Math.PI / 2) {
				e1.getComponent(SpriteSheetBody).clearQueue();
				e1.getComponent(SpriteSheetBody).doAction(attack2.spriteSheetId);
			}
		}
		
		physicsManager.contactSignaler.bind(function (contact :Contact) :Void {
			if (contact.contact1 != null && contact.contact2 != null) {
				checkContact(contact.contact1.owner, contact.contact2.owner);
				checkContact(contact.contact2.owner, contact.contact1.owner);
			}
		});
		
		gamescene.update();
	}
	
	static function createPhysicsWorld (layer :BaseSceneLayer<Dynamic, Dynamic>) :PhysicsManager
	{
		var context = layer.context;
		var sceneView = context.getManager(SceneView);
		
		var physicsManager = context.addSingletonComponent(PhysicsManager);
		physicsManager.m_physScale = 30;
		#if (debug && flash)
		var spriteComponent = context.allocate(com.pblabs.components.scene2D.flash.SceneComponent);
		var sprite = org.transition9.util.SpriteUtil.create();
		spriteComponent.parentProperty = layer.entityProp();
		spriteComponent.displayObject = sprite;
		spriteComponent.spatialProperty = null;
		var debugEntity = context.createEntity();
		debugEntity.addComponent(spriteComponent);
		debugEntity.initializeEntity("debuglayer");
		physicsManager.setDebugLayer(sprite);
		#end
		
		physicsManager.setBounds(layer.scene.sceneView.width, layer.scene.sceneView.height);
		
		return physicsManager;
	}
	
	public static function main() 
	{
		new Demo();
	}
	
	var game :PBGame;
}
