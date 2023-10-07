extends Spatial

var nivel = 0  # nivel = 0 ==> intro

#var pre_nivel1 = preload("res://asset/meta/pantallas/intro_suelo.tscn")
var pre_nivel1 = preload("res://asset/meta/pantallas/nivel1.tscn")
var nivel1
var JPI 


# Called when the node enters the scene tree for the first time.
func _ready():
#	Conectando señales
	if nivel == 0:
		print("la mierda de señal del área: ",get_node("introSuelo/puerta/puertaArea").connect("body_entered", self, "_on_body_entered"))
		JPI = get_node("CaracBase").transform
	pass # Replace with function body.
	JPI = get_node("CaracBase").transform


func _on_body_entered(body):
	# Puedes hacer lo que necesites con este objeto, por ejemplo, imprimir su nombre:
	if body.name == "CaracBase" && nivel == 0:
		print("Algo ha entrado en el área:", body.name)
#		print("la mierda de señal del área: ", get_node("introSuelo/puerta/puertaArea").disconnect("body_entered", self, "_on_body_entered"))
		get_node("CaracBase/tempoGO/hud/Label").set_text("Vamos al museo")
		print("la mierda de señal del temporizador: ",get_node("CaracBase/tempoGO/TimerGO").connect("timeout", self, "_mi_funcion_tempo"))
		get_node("CaracBase/tempoGO/TimerGO").start(2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

#func _process(delta):
#	pass

func _mi_funcion_tempo():
	print("pasar de nivel")
	if nivel ==0:
		get_node("CaracBase").set_transform (JPI)
		get_node("CaracBase/tempoGO").tiempo = 25
		get_node("CaracBase/tempoGO/hud/Label").set_text(str("Comienza la carga de recursos: pantalla 1 \n")+"Enseguiada a jugar")
		nivel1 = pre_nivel1.instance()
		add_child(nivel1)
#		get_node("CaracBase/tempoGO/TimerGO").disconnect("timeout", self, "_mi_funcion_tempo")
		get_node("introSuelo").queue_free()
		nivel = 1
#	nivel1 = nueva_escena_terreno.instance()
#	add_child(nivel1)    str("Bienvenido: \n")+"Tiempo¡  a jugar"
	pass
