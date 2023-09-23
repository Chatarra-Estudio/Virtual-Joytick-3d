extends KinematicBody

#export var gravity = Vector3.DOWN * 20
export var gravity = Vector3.DOWN * 5
#export var speed = 45
export var speed = 1.2
export var rot_speed = 0.3
onready var escenaontrol = get_node("Control/Virtual joystick")
var velocity = Vector3.ZERO
	
func _physics_process(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
#	if Input.is_action_pressed("forward"):
	if escenaontrol._output.y < 0:
#		print("pa alante")
		velocity += -transform.basis.z * speed * -escenaontrol._output.y
#		print("pulsando",-escenaontrol._output.y)
#		print("pa que suba")
		vy += speed *-escenaontrol._output.y*delta*7
		
	elif escenaontrol._output.y > 0:
	#		print("pa atras")
		velocity += transform.basis.z * speed * escenaontrol._output.y
		#print("pa que suba")
		vy += speed *escenaontrol._output.y*delta*7

		
	if escenaontrol._output.x > 0:
		rotate_y(-rot_speed * delta * escenaontrol._output.x)
	elif escenaontrol._output.x < 0:
		rotate_y(rot_speed * delta * - escenaontrol._output.x)
	
#	print("antes",-escenaontrol._output.y)
	velocity.y = vy
#	print(escenaontrol._output.x)
	velocity += gravity * delta
	velocity = move_and_slide(velocity, Vector3.UP)
	
#		La dtección y el reinicio en el hu_go
#	if global_transform.origin.y <  -20:
##		print(global_transform.origin.y)
#		print(get_tree().reload_current_scene())
