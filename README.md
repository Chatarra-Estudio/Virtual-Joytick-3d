# Godot controles 3d chatarreros + Virtual Joystick

Aquí unos controles chatarreros de kinemático 3d con suelo plano para exportar en html.

El germen del proyecto de producir unos controles 3d surgió de un intento, no satisfactorio, para una Game Jam de pocas horas donde. El objetivo de nuestro proyecto era hacer unos controles básicos para un submarino. Finalmente tenemos una plantilla con joytick virtual t movimiento en 3d: 

https://github.com/Chatarra-Estudio/Virtual-Joytick-3d/tree/437d8bb987b4bb11bce31ce0715674a3b5abe02a
https://josegarciamoreno.github.io/Chatarra-Estudio/landing2023/ferdi/3d.html


Pruebas de 3d

https://3d.csm.ai/login

https://josegarciamoreno.github.io/Chatarra-Estudio/landing2023/sensor/acelera.html (Probando giroscopio: no va)

https://josegarciamoreno.github.io/Chatarra-Estudio/landing2023/submarino/amarillo.html Interfaz chatarrero para movil

Virtual joystick for touchscreens, with useful options.

<img src="https://raw.githubusercontent.com/Chatarra-Estudio/Virtual-Joytick-3d/586eb2ef595721dd4ea31b958722a5f79b96f149/ferdi/joystick3d.jpg">


Godot Virtual Joystick
Aquí unos controles chatarreros de kinemático 3d con suelo plano para exportar en html.
--------------------------------------------------------------------------------------------------

# Godot Virtual Joystick

<img src="https://raw.githubusercontent.com/MarcoFazioRandom/Virtual-Joystick-Godot/840bf4c5b0b7df277ee58192abd9306d2e99a4f8/previews/icon.png" width="300">

A simple virtual joystick for touchscreens, with useful options.

GitHub Page: https://github.com/MarcoFazioRandom/Virtual-Joystick-Godot

Godot Engine: https://godotengine.org

### PREVIEWS:

<img src="https://raw.githubusercontent.com/MarcoFazioRandom/Virtual-Joystick-Godot/840bf4c5b0b7df277ee58192abd9306d2e99a4f8/previews/preview1.png" width="500">

Easy to setup:  
<img src="https://raw.githubusercontent.com/MarcoFazioRandom/Virtual-Joystick-Godot/840bf4c5b0b7df277ee58192abd9306d2e99a4f8/previews/preview2.png" width="300">

Easy to use:  
<img src="https://raw.githubusercontent.com/MarcoFazioRandom/Virtual-Joystick-Godot/840bf4c5b0b7df277ee58192abd9306d2e99a4f8/previews/preview2.png" width="500">

### OPTIONS:  

- Joystick mode: 
	- Fixed: The joystick doesn't move. 
	- Dynamic: Every time the joystick area is pressed, the joystick position is set on the touched position. 

- Dead zone size: If the tip is inside this range the output is zero.

- Clamp zone size: The max distance the tip can reach.

- Visibility mode: 
	- Always: Always visible.
	- touchscreen only: Visible on touch screens only (will hide if the device has not a touchscreen).

- Use input actions: if true the joystick will trigger the input actions created in Project -> Project Settings -> Input Map

### HELP:  
- The Control parent of the joystick is the area in which the joystick can move in Dynamic mode.  
- For moving the joystick inside his area, select it, right click, turn on "Editable Children" and then change the position of the Base node.  
- With "Editable Children" turned on you can also edit the joystick textures and colors.  
- To be able to use the joystick with the mouse, you have to go to Project settings -> Input Devices -> Pointing, and turn on the option "emulate touch from mouse".
- If you want multitouch, make sure to disable the option "emulate mouse from touch".
- Create a CanvasLayer node and name it "UI", it'll contain all the UI elements, then add the Joystick scene as a child of the UI node and move it where you prefer.  
- An example scene is provided in the "Test" folder.  
