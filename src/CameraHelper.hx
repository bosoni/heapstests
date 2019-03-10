import h3d.Vector;

// +Z forward, -Z backward
class CameraHelper 
{
   static var piOver180 = Math.PI / 180.0;

   var rot = new Vector();
   var dir = new Vector(0, 0, 1);
   var m = new h3d.Matrix();
   var cam : h3d.Camera;

   public function print()
   {
      var str = "\ncam.pos.set( " + cam.pos.toString() + " );\n";

      str += "cam.rot( " + rot.toString() + " );\n";
      str += "cam.dir( " + dir.toString() + " );\n";
      str += "\n";
      trace(str);
   }

   public function new(camm : h3d.Camera, camPos : Vector, camTarget : Vector) {
      cam        = camm;
      cam.pos    = camPos;
      cam.target = camTarget;
      cam.up     = new Vector(0, 1, 0);
   }

   // TODO test
   public function getDirection()
   {
      var rx = rot.x;
      var ry = rot.y;

      // var rz = rot.z;
      dir.x = Math.sin(ry) * Math.cos(-rx);
      dir.y = Math.sin(-rx);
      dir.z = Math.cos(ry) * Math.cos(-rx);
   }

   public function rotate(mx : Float, my : Float, scale : Float)
   {
      rot.x += mx * scale;
      rot.y += my * scale;
      dir.set(0, 0, 1);
      m.initRotation(rot.x, rot.y, 0);
      dir.transform(m);
      cam.target.x = cam.pos.x + dir.x;
      cam.target.y = cam.pos.y + dir.y;
      cam.target.z = cam.pos.z + dir.z;
   }

   public function move(spd : Float)
   {
      var rx = rot.x;
      var ry = rot.y;

      // var rz = rot.z;
      cam.pos.x   -= Math.sin(ry) * Math.cos(-rx) * spd;
      cam.pos.y   -= Math.sin(-rx) * spd;
      cam.pos.z   -= Math.cos(ry) * Math.cos(-rx) * spd;
      cam.target.x = cam.pos.x + dir.x;
      cam.target.y = cam.pos.y + dir.y;
      cam.target.z = cam.pos.z + dir.z;
   }

   // sivuttaisliikkuminen xz tasossa
   public function strafe(spd : Float)
   {
      // var rx = rot.x;
      var ry = (rot.y - (90.0 * piOver180));

      // var rz = rot.z;
      cam.pos.x   -= Math.sin(ry) * spd;
      cam.pos.z   -= Math.cos(ry) * spd;
      cam.target.x = cam.pos.x + dir.x;
      cam.target.y = cam.pos.y + dir.y;
      cam.target.z = cam.pos.z + dir.z;
   }
}
