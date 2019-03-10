Heaps.io tests
==============
by mjt, 2019
Released under MIT license.


At main.hx, one can change test which test to run.


Blender:
Animations:
* modeled stickman with armature T-pose, save .blend, export it to .fbx
* created walk anim, saved it different .blend, export only armature to walk.fbx
* loaded T-pose, created idle anim, saved it different .blend, export only armature to idle.fbx

Scenes works when exporting to .fbx but animations doesn't.
I use workaround: 
* downloaded Autodesk FBX Converter x64 2013 (windows, but there is fbx conv on linux too, but haven't tested)
* on Blender, fbx export Y-UP and Z-Forward
* I convert *.fbx -> .dae  and then *.dae -> .fbx, then scenes and animations works.
