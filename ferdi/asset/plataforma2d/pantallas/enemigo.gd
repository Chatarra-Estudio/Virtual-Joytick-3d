extends KinematicBody2D

var move_speed = 100  # Velocidad de movimiento
#var direction = Vector2.RIGHT  # Dirección inicial del enemigo
var direction = Vector2.LEFT
var detection_distance = 10  # Distancia para detectar el borde
var velo

func _physics_process(delta):
	# Mueve al enemigo en la dirección actual
	velo = move_and_slide(direction * move_speed, Vector2.UP)
	
	# Comprueba si el enemigo está cerca del borde
#	var _raycast_pos = position + direction.normalized() * detection_distance
#	print(is_on_floor(get_node("RayCast2D")))
#	print(raycast_pos)
#	print(RayCast2D.is_colliding())
#	print(get_node("iz").is_colliding())
#	print(is_on_floor())
#	print(get_node("de").is_colliding())

	if  is_on_wall(): 
		direction = -direction
	if (get_node("iz").is_colliding() && !get_node("de").is_colliding()) :
		direction = -direction
		position.x = position.x - 5
#		print("posi , cambia",position)
	
	if (!get_node("iz").is_colliding() && get_node("de").is_colliding()) :
		direction = -direction
		position.x = position.x + 5
#		print("posi",position)

#	if (is_on_wall()):
#		direction = -direction
#	if not is_on_floor() or not is_on_wall() :
#		direction = -direction
#    if not is_on_floor() or not is_on_wall() or not is_on_floor(raycast_pos):
#        direction = -direction


func _on_Area2D_body_entered(body):
	if body == get_parent().get_parent().get_child(0):
#		print("pa", get_parent().get_child(0))
		get_parent().get_parent().malos -=1
		print("body",get_parent().get_parent().malos)
#		print("body",body.name)
		queue_free()
	pass # Replace with function body.
