extends Node2D
# Declare member variables here. Examples:
var tiempo : int = 20
var go = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TimerGO").start()
	get_node("hud/Label").set_text(str(tiempo))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerGO_timeout():
	if tiempo > 1  :
		tiempo -=1
		get_node("hud/Label").set_text(str(tiempo))
		
		get_node("TimerGO").start()
	
	elif tiempo == 1  :
		print("game over")
		go = true
		tiempo -=1
		get_node("hud/Label").set_text("Game Over")
		get_node("TimerGO")
	
	else  :
		get_tree().reload_current_scene()
		
		
	
	pass # Replace with function body.
