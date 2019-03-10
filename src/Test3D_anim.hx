import hxd.Key;
import h3d.Vector;

class Test3D_anim extends hxd.App {
   var ev : Events;
   var cam : CameraHelper;
   var player : Model;

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
      // adds a directional light to the scene
      var light = new h3d.scene.DirLight(new h3d.Vector(0, -1, 0.2), s3d);

      light.enableSpecular = true;

      // set the ambient light to 30%
      s3d.lightSystem.ambientLight.set(0.3, 0.3, 0.3);

      // Create a model cache
      var cache = new h3d.prim.ModelCache();
      Model.set(cache);
      player = new Model();
      player.load("models/stickman_no_ANIM.fbx");
      player.loadAnimation("models/stickman_idle.fbx");
      player.loadAnimation("models/stickman_walk.fbx");
      player.playAnimation(0);
      player.obj.scale(0.01);
      player.obj.rotate(0, 90, 0);
      player.addToScene();

      var floor = new Model();
      var wall  = new Model();
      for (x in 0...10)
      {
         floor.load("models/floor.fbx");
         floor.obj.setPosition(-10 + x * 2, 0, 0);
         floor.obj.scale(0.01);
         floor.addToScene();

         wall.load("models/wall.fbx");
         wall.obj.setPosition(-10 + x * 2, 0, 0);
         wall.obj.scale(0.01);
         wall.addToScene();
      }

      // Clear the cache instance. Note that cache will dispose all cached model textures as well.
      cache.dispose();
   }

   override function update(dt : Float)
   {
      super.update(dt);

      if (Key.isPressed(Key.ESCAPE))
      {
         dispose();
         Util.exit();
      }

      var SPD = 5.;
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

      var dir = 0;
      if (Key.isDown(Key.UP))
      {
         player.forward(dt * SPD * 0.5);
         dir = 1;
      }
      if (Key.isDown(Key.DOWN))
      {
         player.forward(-dt * SPD * 0.5);
         dir += -1;
      }
      if (Key.isDown(Key.LEFT))
      {
         player.obj.rotate(0, -dt * SPD, 0);
      }
      if (Key.isDown(Key.RIGHT))
      {
         player.obj.rotate(0, dt * SPD, 0);
      }
      if (dir != 0)
      {
         player.playAnimation(1); // walk
      }
      else
      {
         player.playAnimation(0);   // idle
      }
      if (ev.mousePressed[0] == true)
      {
         var mx = s2d.mouseX - ev.oldMouseX;
         var my = s2d.mouseY - ev.oldMouseY;

         cam.rotate(my, mx, Math.PI / 360.);
      }
      ev.oldMouseX = s2d.mouseX;
      ev.oldMouseY = s2d.mouseY;
   }

   override function dispose()
   {
      //trace("dispose()");
      s2d.dispose();
      s3d.dispose();
   }
}
