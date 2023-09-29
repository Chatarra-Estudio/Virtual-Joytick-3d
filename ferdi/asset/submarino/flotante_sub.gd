extends KinematicBody

export var gravity = Vector3.DOWN * 20
#export var speed = 45
export var speed = 8
export var rot_speed = 0.9
onready var escenaontrol = get_node("Control/Virtual joystick")
var velocity = Vector3.ZERO
	
func _physics_process(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
#	palante
	if escenaontrol._output.y < 0:
		velocity += -transform.basis.z * speed * -escenaontrol._output.y
	elif escenaontrol._output.y > 0:
		velocity += transform.basis.z * speed * escenaontrol._output.y
		
	if escenaontrol._output.x > 0:
		rotate_y(-rot_speed * delta * escenaontrol._output.x)
	elif escenaontrol._output.x < 0:
		rotate_y(rot_speed * delta * - escenaontrol._output.x)

	velocity.y = vy
#	print(escenaontrol._output.x)
	velocity += gravity * delta
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if global_transform.origin.y <  -10:
#		print(global_transform.origin.y)
		print(get_tree().reload_current_scene())


func _on_Area_body_entered(_body):
#	print(get_parent().get_child(1).get_node("hud_go_subma").get_node("tempoGO").go)
#	cuidado con los nodos y el arbol de la escena mundo. borrar todos hijos y poner:
#	munndo
#	- carac_SUB
#	- terreno_fondo
#	CUIDADO: hay que poner hijos editables y conectar el área al script de caracter
	get_parent().get_child(0).get_node("hud_go_subma/tempoGO/hud/Label").set_text("win")
	if (!get_parent().get_child(0).get_node("hud_go_subma/tempoGO").go):
		get_parent().get_child(0).get_node("hud_go_subma/tempoGO/TimerGO").start(3)
		get_parent().get_child(0).get_node("hud_go_subma/tempoGO").go = true
	print(get_parent().get_child(0).get_node("hud_go_subma/tempoGO").go)
	print("win")
	pass # Replace with function body.
