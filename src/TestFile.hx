import hxd.Key;

class TestFile extends hxd.App 
{
   override function init()
   {
      super.init();
      Util.set(s2d, s3d);
      StartTest();
   }

   function StartTest()
   {
      trace("file test");

        #if sys
      trace("file system can be accessed with sys.io.File");
      var content : String = sys.io.File.getContent('res/text.txt');
      trace(content);
        #else
      trace("file system can't be accessed with sys.io.File");
        #end

      var f   = hxd.Res.loader.load("text.txt");
      var str = f.toText();
      trace(str);
   }

   override function update(dt : Float)
   {
      super.update(dt);

      if (Key.isPressed(Key.ESCAPE))
      {
         dispose();
         Util.exit();
      }
   }

   override function dispose()
   {
      // trace("dispose()");
   }
}
