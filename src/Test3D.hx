import hxd.Key;
import h3d.Vector;

class Test3D extends hxd.App
{
   var ev : Events;
   var cam : CameraHelper;
   var player : Model;
   var action : Intersect = new Intersect();

   override function init()
   {
      super.init();
      ev  = new Events();
      cam = new CameraHelper(s3d.camera, new Vector(0, 2, -10), new Vector(0, 0, 0));
      Util.set(s2d, s3d);
      StartTest();
   }

   function StartTest()
   {
      var light = new h3d.scene.DirLight(new h3d.Vector(0, -1, 0.2), s3d);

      light.enableSpecular = true;
      s3d.lightSystem.ambientLight.set(0.3, 0.3, 0.3);

      var cache = new h3d.prim.ModelCache();
      Model.set(cache);
      player = new Model();
      player.load("models/stickman_no_ANIM.fbx");
      player.loadAnimation("models/stickman_idle.fbx");
      player.loadAnimation("models/stickman_walk.fbx");
      player.playAnimation(0);
      player.obj.scale(0.01);
      player.addToScene();

      var skene = new Model();
      skene.load("models/skene1.fbx");
      skene.obj.scale(0.01);
      skene.addToScene();

      action.add(skene.obj);

      cache.dispose();

      hxd.System.setNativeCursor(hxd.Cursor.Hide);

      Util.showTree(s3d);

   }

   override function update(dt : Float)
   {
      super.update(dt);

      if (Key.isPressed(Key.ESCAPE))
      {
         dispose();
         Util.exit();
      }


      var SPD = 10.;
      if (Key.isDown(Key.W))
      {
         cam.move(-dt * SPD);
      }
      if (Key.isDown(Key.S))
      {
         cam.move(dt * SPD);
      }

      if (Key.isDown(Key.A))
      {
         cam.strafe(-dt * SPD);
      }
      if (Key.isDown(Key.D))
      {
         cam.strafe(dt * SPD);
      }

      if (ev.mousePressed[0] == true)
      {
         var mx = s2d.mouseX - ev.oldMouseX;
         var my = s2d.mouseY - ev.oldMouseY;

         cam.rotate(my, mx, Math.PI / 360.);
      }

      ev.oldMouseX = s2d.mouseX;
      ev.oldMouseY = s2d.mouseY;

      /*if (action.mesh != null)
      {
         trace(">> " + action.mesh.name);
      }*/

      // cam.print(); // show camera coordinates

      action.reset();
   }

   override function dispose()
   {
      //trace("dispose()");
      s2d.dispose();
      s3d.dispose();
   }
}
