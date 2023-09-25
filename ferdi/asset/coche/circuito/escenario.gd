extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
#	print(get_node("potenciaMet/TimerW/Sprite").hide())
	get_node("potenciaMet/Sprite").hide()
#	print(get_parent().get_child(2).get_child(0).global_transform.origin.y)
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# recuerda que debes poner los siquientes nodos en l escena mundo:
# mundo
#	tempoGO
#	CarBase
#	escenario
# ********también puedes mirar el orden con el get_child
func _process(_delta):
	if (get_parent().get_child(1).get_child(0).global_transform.origin.y < -5.2) and (!bool(get_parent().get_child(0).go)):
		print(get_parent().get_child(0).get_child(1).get_child(0).set_text("game over\n"+ "tiempo restante: "+ str(get_parent().get_child(0).tiempo) ))
		get_parent().get_child(0).get_child(0).start(3)
		get_parent().get_child(0).go = true
		
#	pass


func _on_Area_body_entered(_body):
#	print("entra")
	get_parent().get_child(0).tiempo += 25
	pass # Replace with function body.


func _on_AreaMEta_body_entered(_body):
	print("entra")
	get_node("potenciaMet/Sprite").show()
	get_parent().get_child(0).get_child(0).start(3)
	get_parent().get_child(0).go = true
	pass # Replace with function body.
