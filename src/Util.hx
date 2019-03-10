import h3d.scene.Object;

class Util
{
   public static var s2d : h2d.Scene;
   public static var s3d : h3d.scene.Scene;

   public static function set(_s2d, _s3d)
   {
      s2d = _s2d;
      s3d = _s3d;
   }

   public static function exit()
   {
      #if !js
      Sys.exit(0);
      #end
   }

   public static function showTree(s3d : h3d.scene.Scene)
   {
      var num = s3d.numChildren;

      for (c in 0...num)
      {
         var child = s3d.getChildAt(c);
         trace(child.name);
         tree(child);
      }
   }

   static function tree(child : Object)
   {
      var cnum = child.numChildren;

      for (cc in 0...cnum)
      {
         trace("  " + child.name);
         tree(child.getChildAt(cc));
      }
   }
}
