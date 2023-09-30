extends Node


# Declare member variables here. Examples:
# var a = 2
var cara 
var malos = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	cara = get_child(0)
#	print(get_child(0).position.y)
#	print(get_child(0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	print(get_node(en))
#	print(get_child(0).position.y)
	print(get_node("caracter2d/tempoGO"))
	if cara.position.y > 500 && !get_node("caracter2d/tempoGO").go :
		get_node("caracter2d/tempoGO").go = true
		get_node("caracter2d/tempoGO/TimerGO").start(3)
		get_node("caracter2d/tempoGO/hud/Label").set_text("Game Over por caida")
#		print("ff")
#		print(get_node("tempoGO").go)
#	print(get_node("caracter2d/"))
	if malos == 0 && !get_node("caracter2d/tempoGO").go :
		get_node("caracter2d/tempoGO").go = true
		get_node("caracter2d/tempoGO/TimerGO").start(3)
		get_node("caracter2d/tempoGO/hud/Label").set_text("Win: Máquina")
#		get_node("tempoGO/hud/Label").set_text(" win máquina")
#		print("win")
	#	pass
