extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_node("tempoGO/hud/Label").set_text("Tiempo¡  a jugar"))
	get_node("tempoGO/hud/Label").set_text(str("Bienvenido: \n")+"Tiempo¡  a jugar")
	print("tiempo para morir: " , get_node("tempoGO").tiempo, " segundos ")
	print(get_parent().global_transform.origin.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	game over de suelo
#	if((get_parent().global_transform.origin.y < -3.5)):
##	if((get_parent().global_transform.origin.y < -3.5) & (get_node("tempoGO").go == true)):
##		get_node("tempoGO/TimerGO").start()
#		get_node("tempoGO/hud/Label").set_text("game over\n"+ "tiempo restante: " + str(get_node("tempoGO").tiempo))
##		get_node("tempoGO").tiempo = 2
##		print(get_node("tempoGO").go)
#		get_node("tempoGO").go = true
##		print(get_node("tempoGO").go)
##			print(get_parent().global_transform.origin.y)
##			print(get_tree().reload_current_scene())
	if((get_parent().global_transform.origin.y > 20.5)):
#		get_node("tempoGO/TimerGO").start()
		get_node("tempoGO/hud/Label").set_text("game over, te quemas con el sol" + str(get_node("tempoGO").tiempo))
		get_node("tempoGO").go = true
#	pass
