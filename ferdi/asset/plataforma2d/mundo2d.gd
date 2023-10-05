extends Node

var cara   # caracter node

var malos = 3
var nivel = 0
var va_IG 
var va_IV
var va_ITP1 
var va_Ipalyer : Vector2

# patallas
var scene1_to_add = preload("res://asset/plataforma2d/pantallas/pantalla1.tscn")
var scene_1 = scene1_to_add.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	cara = get_child(1)
	get_node("caracter2d/tempoGO/hud/Label").set_text("Empezamos")
#	print(get_child(0).position.y)
#	print(get_child(0))
	va_Ipalyer = cara.global_position
	va_IV = cara.speed
	cara.speed = 2
#	cara.gravity = 800
	va_IG = cara.gravity
	cara.gravity = 8
#	get_node("transicion_mapa/Timer").start(3)
	va_ITP1 = get_node("caracter2d/tempoGO").tiempo 
	print("cargo valores", va_ITP1)
	get_node("transicion_mapa").show()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	print(get_node(en))
	if nivel == 0 && get_node("transicion_mapa/Timer").is_stopped():
		get_node("transicion_mapa/Timer").start(2)
		print(get_node("caracter2d/tempoGO").tiempo,"empieza entradilla")
#		get_node("caracter2d/tempoGO/TimerGO").start(3)
#		get_node("transicion_mapa/Timer").one_shot()
		nivel = 1
#		print("2")
#		va_ITP1 = get_node("caracter2d/tempoGO").tiempo
#		print(get_node("caracter2d/tempoGO").tiempo)
#	elif nivel == 1 
#	print(get_child(0).position.y)
#	print(get_node("caracter2d/tempoGO"))
	if cara.position.y > 500 && !get_node("caracter2d/tempoGO").go :
		get_node("caracter2d/tempoGO").go = true
		get_node("caracter2d/tempoGO/TimerGO").start(3)
		get_node("caracter2d/tempoGO/hud/Label").set_text("Game Over por caida")
#		print("ff")
#		print(get_node("tempoGO").go)
#	print(get_node("caracter2d/"))
	if malos == 0 && !get_node("caracter2d/tempoGO").go :
		if nivel == 1:
#			get_node("caracter2d/tempoGO").go = true
	#		get_node("caracter2d/tempoGO/TimerGO").start(3)
			malos = 3
			nivel = 2
			cara.speed = 2
			cara.gravity = 8
#			get_node("transicion_mapa/Timer").start(2)
			get_node("transicion_mapa").show()
			get_node("transicion_mapa/ParallaxBackground/ParallaxLayer/Sprite").show()
			get_node("transicion_mapa/ParallaxBackground/ParallaxLayer/ColorRect").show()
			get_node("transicion_mapa/ParallaxBackground/ParallaxLayer/Sprite").position.y = get_node("transicion_mapa/ParallaxBackground/ParallaxLayer/Sprite").position.y - 100
#			reinicio()
			cara.global_position = va_Ipalyer
			get_node("caracter2d/tempoGO/TimerGO").start(1)
			get_node("transicion_mapa/Timer").start(2)
			get_node("caracter2d/tempoGO/hud/Label").set_text("pasa a nivel 2")
			
			scene_1.queue_free()
		
		elif nivel == 2:
			get_node("caracter2d/tempoGO").go = true
			get_node("caracter2d/tempoGO/TimerGO").start(2)
			get_node("transicion_mapa/Timer").start(2)
			get_node("caracter2d/tempoGO/hud/Label").set_text("Win: Máquina")
			
#		get_node("tempoGO/hud/Label").set_text(" win máquina")
#		print("win")
	#	pass


func _on_Timer_timeout():
	if nivel == 1:
#		get_node("caracter2d/tempoGO").tiempo = va_ITP1
#		get_node("caracter2d/tempoGO").tiempo 
		nivel = 1
#		add_child(scene_1)
		get_node("transicion_mapa").add_child(scene_1)
		reinicio()
		print("empieza    nivel ==1")
	elif nivel == 2:
		print("empieza    nivel ==2")
		reinicio()
		scene_1 = scene1_to_add.instance()
		get_node("transicion_mapa").add_child(scene_1)
#		add_child(scene_1)
	
	pass # Replace with function body.
	
func reinicio():
	pass
	get_node("caracter2d/tempoGO").tiempo = va_ITP1
	get_node("caracter2d/tempoGO/TimerGO").start(1)
#	print(get_node("caracter2d/tempoGO").tiempo)
	cara.gravity = va_IG
	cara.speed = va_IV 
#	print(get_node("transicion_mapa"))
	get_node("transicion_mapa/ParallaxBackground/ParallaxLayer/Sprite").hide()
	get_node("transicion_mapa/ParallaxBackground/ParallaxLayer/ColorRect").hide()
	cara.global_position = va_Ipalyer


func _on_TextureButton_pressed():
	print("entra")
#	cara.input_vector.x -= 1
	pass # Replace with function body.
