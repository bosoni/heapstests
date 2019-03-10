import hxd.Event.EventKind;

class Events
{
   public var mousePressed = [false, false, false];
   public var mouseWheel   = 0.0;
   public var oldMouseX    = 0.;
   public var oldMouseY    = 0.;

   public inline function new()
   {
      hxd.Window.getInstance().addEventTarget(onEvent);
   }

   public function dispose()
   {
      hxd.Window.getInstance().removeEventTarget(onEvent);
   }

   function onEvent(event : hxd.Event)
   {
      //trace(event.toString()); // DEBUG

      if (event.kind == EventKind.EPush)
      {
         // .button 0=left, 1=right, 2=center
         mousePressed[event.button] = true;
      }
      else
      if (event.kind == EventKind.ERelease)
      {
         mousePressed[event.button] = false;
      }
      else
      if (event.kind == EventKind.EWheel)
      {
         mouseWheel = event.wheelDelta;
      }
   }
}
