class Main
{
   static function main()
   {
   #if js
      hxd.Res.initEmbed();
   #else
      hxd.Res.initLocal();
   #end

      new Test2D();
      //new Test3D_anim();
      //new Test3D();

      //new TestFile();
   }
}
