import h2d.Bitmap;
import h3d.Vector;
import hxd.Key;
import h2d.Object;
import h2d.Font;

class Test2D extends hxd.App
{
   var ev : Events;

   var imgNode : Object;
   var mouseNode : Object;

   var img : Image;
   var dir = 1.0;
   var x = 100.0;

   override function init()
   {
      super.init();
      ev = new Events();
      Util.set(s2d, s3d);
      StartTest();
   }

   function StartTest()
   {
      {
         imgNode = new h2d.Object(s2d);
         var tile = hxd.Res.loader.load("images/img1.png").toTile();
         //tile = tile.center();
         var bmp = new h2d.Bitmap(tile, imgNode);
         imgNode.setScale(3);
         imgNode.setPosition(0, 0);
      }

      {
         var font : h2d.Font = hxd.res.DefaultFont.get();
         var tf = new h2d.Text(font, s2d);
         tf.text = "Hello World ::: 2D test";
         tf.setPosition(10, 5);
         tf.textColor = 0x00FF00; // tf.color=new Vector(0, 1, 0);
         //tf.textAlign = Center;
         //tf.setScale(2);
      }

      {
         var font = hxd.Res.fonts.comic32.toFont();
         var tf   = new h2d.Text(font, s2d);
         tf.text = "Custom font test";
         tf.setPosition(10, 25);
         tf.color = new Vector(1, 0, 0);
      }

      img = new Image();
      img.load("images/img2.png");
      img.set(x, 500, 1, 0);
      img.setOrigin(-128, -128);

      {
         mouseNode = new h2d.Object(s2d);
         var tile = hxd.Res.loader.load("images/mouse.png").toTile();
         var bmp  = new h2d.Bitmap(tile, mouseNode);
      }

   }

   override function update(dt : Float)
   {
      super.update(dt);

      if (Key.isPressed(Key.ESCAPE))
      {
         dispose();
         Util.exit();
      }

      if(x < 100 || x > 500) dir = -dir;
      img.set(x += dir*dt*100, 500, 1, x*0.1);


      mouseNode.setPosition(s2d.mouseX, s2d.mouseY);
      if (ev.mousePressed[0] == true)
         mouseNode.setScale(2);
      else
         mouseNode.setScale(1);
   }

   override function dispose()
   {
      //trace("dispose()");
      s2d.dispose();
      ev.dispose();
   }
}
