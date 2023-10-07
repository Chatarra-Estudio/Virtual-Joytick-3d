extends KinematicBody2D

var gravity = 800  # Gravedad
var is_on_ground = false  # Bandera para verificar si el personaje está en el suelo

var move_speed = 7000  # Velocidad de movimiento
#var direction = Vector2.RIGHT  # Dirección inicial del enemigo
var direction = Vector2.LEFT
var detection_distance = 10  # Distancia para detectar el borde
var velo
var velocity : Vector2

## animacion despedida
#var move_speed_des = 10000.0  # Velocidad constante hacia arriba
#var move_duration = 0.5  # Duración total del movimiento en segundos
var timer = Timer.new()
var muerte = false

func _physics_process(delta):

	# Mueve al enemigo en la dirección actual
	velo = move_and_slide(direction * move_speed * delta, Vector2.UP)
	
	if  is_on_wall(): 
		direction = -direction
		
	if (get_node("iz").is_colliding() && !get_node("de").is_colliding()) :
		direction = -direction
		position.x = position.x - 5
#		print("posi , cambia",position)
	if (!get_node("iz").is_colliding() && get_node("de").is_colliding()) :
		direction = -direction
		position.x = position.x + 5
#		print("posi",position

	# Aplicar gravedad
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	# muerte por caida
	if position.y > 600:
#		print(get_parent().get_child_count())
		if(get_parent().get_child_count() == 1):# si era el ultimo
			print("Un Win", get_parent().get_parent().get_parent().get_node("cara2d_salto/tempoGO/hud/Label"))
			var win = get_parent().get_parent().get_parent().get_node("cara2d_salto")
			win.get_node("tempoGO/hud/Label").set_text("You Win, máquina")
			win.get_node("tempoGO").go = true
			win.get_node("tempoGO/TimerGO").start(3)
			win.gravity = win.gravity*0.3
#			win.jump_force = win.jump_force*0.5
			win.salto(win.jump_force)
			
		queue_free()
		

func _on_Area2D_body_entered(body):
#	jump_force
	var jugador = body.get_parent().get_node(body.name)
#	var aniMu
#	var colli
#	print(body.name)
	if body.name == "cara2d_salto" && !muerte:
#	if body.name == "cara2d_salto" && !muerte && !jugador.get_node("tempoGO").go:
#		print(jugador.jump_force)
		muerte = true
		jugador.salto(jugador.jump_force*0.75)
		
#		print(jugador.get_node("tempoGO").go)
		jugador.get_node("tempoGO/TimerGO").start(0.5)
		jugador.get_node("tempoGO/hud/Label").set_text("Mete puntos, máquina")
#		jugador.get_node("tempoGO").go = true
#		jugador.go = true
#		probando con duplicado
#		aniMu = get_node("AnimatedSprite").duplicate()
#		aniMu.set_name("despe_ene")
#		aniMu.add_child(timer)
#		jugador.add_child(aniMu)

#		probando con mover lejos
#		var posi_con = position
#		set_position(Vector2(1000000,1000000))

		# Desactivar la detección de colisiones para el nodo Collider
#		set_collision_layer_bit(1, false)
#		get_node("CollisionShape2D").disabled = true
#		get_node("CollisionShape2D").queue_free()
#		set_position(posi_con)
		var posi_con = position
		set_position(Vector2(1000000,1000000))
		collision_layer = 0
		collision_mask &= ~1
		set_position(Vector2(posi_con.x,(posi_con.y-150)))
		velocity.y  = -300
#		direction = -direction
#		set_collision_layer_bit(1, false)
#		set_collision_mask_bit(1, false)
#		print(position)

