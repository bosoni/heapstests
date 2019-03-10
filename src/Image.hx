import h2d.Bitmap;
import h2d.Object;

class Image
{
   var img : Object;
   var bmp : Bitmap;
   var tile : h2d.Tile;
   public function new() {}

   public function load(name : String)
   {
      img  = new h2d.Object(Util.s2d);
      tile = hxd.Res.loader.load(name).toTile();
      bmp  = new h2d.Bitmap(tile, img);
   }

   public function set(posX, posY, scale, rotation)
   {
      img.setPosition(posX, posY);
      img.setScale(scale);
      img.rotation = rotation;
   }

   public function setOriginToCenter()
   {
      tile = tile.center();
   }

   public function setOrigin(x, y)
   {
      tile.dx = x;
      tile.dy = y;
   }

   public function dispose()
   {
      tile.dispose();
      Util.s2d.removeChild(img);
   }
}
