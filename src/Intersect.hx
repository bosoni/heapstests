import hxd.Event;
import h3d.scene.Mesh;

class Intersect
{
   public var event : hxd.EventKind;        // onOver, onOut, onMove,  onPressed (?) eli jos hiirel painaa ym.
   public var mesh : h3d.scene.Mesh = null; // missä meshissä event tapahtunut
   public var x : Float;                    // hiiren/kohdan koordinaatit missä tapahtuma tapahtunut
   public var y : Float;
   public var z : Float;

   public function new() {}

   public function add(modelObj : h3d.scene.Object)
   {
      for (o in modelObj)
      {
         if (Std.is (o, Mesh))
         {
            var mesh     = o.toMesh();
            var interact = new h3d.scene.Interactive(mesh.getCollider(), Util.s3d);
            initInteract(interact, mesh);
         }
      }
   }

   public function reset()
   {
      event = EventKind.ECheck;
      mesh  = null;
   }

   function initInteract(i : h3d.scene.Interactive, m : h3d.scene.Mesh)
   {
      i.bestMatch = true;
      i.onOver    = function(e: hxd.Event)
      {
         x     = e.relX;
         y     = e.relY;
         z     = e.relZ;
         event = EventKind.EOver;
      };
      i.onMove = i.onCheck = function(e: hxd.Event)
      {
         x     = e.relX;
         y     = e.relY;
         z     = e.relZ;
         event = EventKind.EMove;
      };
      i.onOut = function(e: hxd.Event)
      {
         event = EventKind.EOut;
      };
      i.onPush = function(e: hxd.Event)
      {
         event = EventKind.EPush;
      };
      i.onRelease = function(e: hxd.Event)
      {
         event = EventKind.ERelease;
      };
   }
}
