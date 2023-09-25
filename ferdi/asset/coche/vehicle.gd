extends VehicleBody


const STEER_SPEED = 1.2
const STEER_LIMIT = 0.4

export var engine_force_value = 40

var steer_target = 0


func _physics_process(delta):
	#	esto, no se pa que
#	var fwd_mps = transform.basis.xform_inv(linear_velocity).x

#	giro con bonera movil
#	print(Input.get_action_strength("turn_left"))
#	print(int(get_parent().get_child(3).get_child(0).pressed)-int(get_parent().get_child(3).get_child(1).pressed))
	steer_target = int(get_parent().get_child(3).get_child(0).pressed)-int(get_parent().get_child(3).get_child(1).pressed)
	steer_target *= STEER_LIMIT


#	giro con botones de teclado
#	steer_target = Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")
#	steer_target *= STEER_LIMIT
	
#	Hacia alante forzado con kinemáticas
	var speed = linear_velocity.length()
	if speed < 5.0 and speed != 0:
#		print(speed)
		engine_force = clamp(engine_force_value * 3 / speed, 0, 100)
#		engine_force = clamp(engine_force_value * 5 / speed, 0, 100)
	else:
		engine_force = engine_force_value

#	Hacia alante con botones teclado
#	if Input.is_action_pressed("accelerate"):
#		# Increase engine force at low speeds to make the initial acceleration faster.
#		var speed = linear_velocity.length()
#		if speed < 5 and speed != 0:
#			engine_force = clamp(engine_force_value * 5 / speed, 0, 100)
#		else:
#			engine_force = engine_force_value
#	else:
#		engine_force = 0
		
#	Hacia atrás con botones teclado
#	if Input.is_action_pressed("reverse"):
#		# Increase engine force at low speeds to make the initial acceleration faster.
#		if fwd_mps >= -1:
#			var speed = linear_velocity.length()
#			if speed < 5 and speed != 0:
#				engine_force = -clamp(engine_force_value * 5 / speed, 0, 100)
#			else:
#				engine_force = -engine_force_value
#		else:
#			brake = 1
#	else:
#		brake = 0.0

	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
