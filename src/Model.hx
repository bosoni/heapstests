import h3d.scene.Object;

/* TODO materials
 *  https://heaps.io/documentation/materials.html
 *
 * var m = new h3d.scene.Mesh(c, s3d);
 * m.material.mainPass.enableLights = true;
 * m.material.shadows = true;
 * m.material.color.load(color);
 *
 */

class Model
{
   static var cache : h3d.prim.ModelCache;

   var model : hxd.res.Model;
   var anims : Array <h3d.anim.Animation> = new Array();
   public var obj : h3d.scene.Object;

   public function new() {}

   public static function set(_cache : h3d.prim.ModelCache)
   {
      cache = _cache;
   }

   public function load(name : String)
   {
      model = hxd.Res.loader.load(name).toModel();
      obj   = cache.loadModel(model);
   }

   public function loadAnimation(name : String)
   {
      model = hxd.Res.loader.load(name).toModel();
      var anim = cache.loadAnimation(model);
      anims.push(anim);
   }

   var lastAnimation = -1;
   public function playAnimation(index)
   {
      if (obj == null)
      {
         trace("load model first");
         return;
      }

      // TODO animation blending
      // https://github.com/HeapsIO/heaps/blob/master/h3d/anim/SmoothTransition.hx


      if (index != lastAnimation)
      {
         obj.playAnimation(anims[index]);
         lastAnimation = index;
      }
   }

   public function setAnimSpeed(spd : Float)
   {
      anims[lastAnimation].speed = spd;
   }

   public function addToScene()
   {
      Util.s3d.addChild(obj);
   }

   public function forward(dt : Float)
   {
      //obj.rotate(0,  90 * Math.PI/180.0, 0); // fix angle
      var dir = obj.getDirection();

      //obj.rotate(0, -90 * Math.PI/180.0, 0); //

      // ukkoa jos pyörittää MYÖTÄPÄIVÄÄN ja kävelee eteenpäin, ukko liikkuu VASTAPÄIVÄÄN,
      // joten vaihdon x<->z päittäin:
      obj.z += dir.x * dt;   // x ja z vaihdettu
      obj.y += dir.y * dt;
      obj.x += dir.z * dt;
   }

   public function dispose()
   {
      trace("todo dispose()");
      obj.dispose();
   }
}
