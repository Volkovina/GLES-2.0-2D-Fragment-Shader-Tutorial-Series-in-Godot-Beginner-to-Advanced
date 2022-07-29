# GLES-2.0-2D-Fragment-Shader-Tutorial-Series-in-Godot-Beginner-to-Advanced
Fragment Shader Tutorial Series in One Godot Project (GLES 2.0) based on GLSL 2D Tutorials of Shadertoy by Ugur Guney

Hi Every One,

This is a converted and interpreted set of shaders compatible Godot Shader Language (GLES 2.0) in One Godot Project.
Thanks to Uğur Güney's efforts from 2014 to 2020. https://www.shadertoy.com/view/Md23DV. It is said it was popular in GLSL Sandbox for while.

It is a template for an organised study medium as my own self-tutorial and for the next ones.

Note: "Book of Shaders in One Godot Project" is in preparatory stage. Website sections completed. Image Processing" section in PDF remainded only.

What has been done and not done
- a Pure Black 200 x 113 pixels PNG created as a texture base for shaded sprites not to use scaling in Godot.
- textures in sprites flipped vertically, because y axis positive direction from top to bottom in Godot, unlike in Shadertoy except "27 MOUSE INPUT".
- one Shadertoy file divided into 29 shader resources file in one folder, because "option structure" such as below cannot be trackable for a long text in Godot Shader easily.
	- #define TUTORIAL 0
	- #if TUTORIAL == 0
	- .........
	- #endif
- all #define terms converted into const ...
- uniform vec2 iResolution = vec2(200.0, 113.0); defined and declared in each shader resource
- fragCoord converted into UV equivalent.
- iTime converted into TIME.
- nested ternaries changed if / else if structure, because Godot GLES 2.0 does not support nested one.
- mat2(x ,y ,z ,w ) structure changed to mat2(vec2(x , y), vec2(z ,w )) structure, otherwise Godot GLES 2.0 does not support.
- in GLES 2.0, both global and local variables definition with same name is not supported. So, they all changed accordingly.
- fragColor converted into COLOR.
- similar 3 Textures found and implemented instead of 3 iChannel Textures.
- different mouse interaction structure organised within GdScript (imouse.gd) to compare iMouse(vec4) in Shadertoy. It can be examined.
- some lines from Shadertoy kept as commented for logic comparison.
- System structured as shown pictures below.
- "esc", "Q" keys, "mouse left click" and "mouse move" intervene in run window.
- main imperfection is not to transport shader codes into run screen as a pair with the result shaded tile. You can check that easily in editor via folders.

Hope this helpful.

![image](https://user-images.githubusercontent.com/80244322/181588173-1c3a221d-c678-4c1e-86ae-d8e3472f4563.png)
![image](https://user-images.githubusercontent.com/80244322/181588459-5719460b-3034-486a-b8ec-eda1684ec4af.png)![image](https://user-images.githubusercontent.com/80244322/181588833-52208da9-6ff1-4c7f-8233-4bf61db16080.png)

TUTORIAL LIST
- 0 COVER - GLSL
- 1 VOID. BLANK SCREEN.
- 2 SOLID COLOR
- 3 GLSL VECTORS
- 4 RGB COLOR MODEL AND COMPONENTS OF VECTORS
- 5 THE COORDINATE SYSTEM
- 6 RESOLUTION, THE FRAME SIZE
- 7 COORDINATE TRANSFORMATION
- 8 HORIZONTAL AND VERTICAL LINES
- 9 VISUALISING THE COORDINATE SYSTEM
- 10 MOVING THE COORDINATE CENTER TO THE CENTER OF THE FRAME
- 11 MAKING THE ASPECT RATIO OF THE COORDINATE SYSTEM 1.0
- 12 DISK
- 13 FUNCTIONS
- 14 BUILT-IN FUNCTIONS: STEP
- 15 BUILT-IN FUNCTIONS: CLAMP
- 16 BUILT-IN FUNCTIONS: SMOOTHSTEP
- 17 BUILT-IN FUNCTIONS: MIX
- 18 ANTI-ALIASING WITH SMOOTHSTEP
- 19 FUNCTION PLOTTING
- 20 COLOR ADDITION AND SUBSTRACTION
- 21 COORDINATE TRANSFORMATIONS: ROTATION
- 22 COORDINATE TRANSFORMATIONS: SCALING
- 23 SUCCESSIVE COORDINATE TRANSFORMATIONS
- 24 TIME, MOTION AND ANIMATION
- 25 PLASMA EFFECT
- 26 TEXTURES
- 27 MOUSE INPUT
- 28 RANDOMNESS

You can left click on the tile or on the MENU to expand the Tile on Screen and then press "esc" to back to Main Screen
![image](https://user-images.githubusercontent.com/80244322/181773657-c851d638-8ec3-4f25-b7a5-85a66cd8afb5.png)![image](https://user-images.githubusercontent.com/80244322/181773762-3b3cd656-1904-4966-a543-52bf2bf9fb29.png)



