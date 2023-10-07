extends KinematicBody2D

# Propiedades de movimiento
var speed = 200  # Velocidad de movimiento
var jump_force = -400  # Fuerza de salto
var gravity = 800  # Gravedad
var is_on_ground = false  # Bandera para verificar si el personaje está en el suelo
var velocity = Vector2()  # Vector de velocidad
var input_vector = Vector2()
var dire_av = 1

func _ready():
	pass  # Puedes inicializar cosas aquí si es necesario

func _physics_process(delta):
	# Obtener la entrada del jugador
	input_vector = Vector2(0,0)
#	print(get_node("Camera2D/TextureButton").is_pressed())
	# Saltar tecla space desde el pared
	if (is_on_wall() && (Input.is_action_just_pressed("jump" ) or  get_node("Camera2D/TextureButton").is_pressed())):
		salto (jump_force)
#		velocity.y = jump_force
		if dire_av == 1:
			position.x = position.x - 5
			dire_av = -dire_av
			get_node("AnimatedSprite").flip_h = false
			print("giro de dere a izquierda en pared")
		else:
			position.x = position.x + 5
			dire_av = -dire_av
			get_node("AnimatedSprite").flip_h = true
#		dire_av = -dire_av
		
	# Detección de colisión con el suelo
	is_on_ground = is_on_floor()
	# Saltar tecla space desde el suelo
#	print(Input.is_action_just_pressed("jump" ) or  get_node("Camera2D/TextureButton").is_pressed())
	if (is_on_ground && (Input.is_action_just_pressed("jump" ) or  get_node("Camera2D/TextureButton").is_pressed())):
		salto (jump_force)
#		velocity.y = jump_force
	
#	Avance automático
	if dire_av == 1:
		input_vector.x += 1
		if  is_on_wall() && is_on_ground:
#			if
#			if is_on_ground :
#					position.x = position.x + 5
#					dire_av = -dire_av
#		if  is_on_wall() && is_on_ground && Input.is_action_just_pressed("jump"): 
			position.x = position.x - 5
			dire_av = -dire_av
#			print(get_node("AnimatedSprite").flip_h)
			get_node("AnimatedSprite").flip_h = false
#			print("giro de dere a izquierda en el suelo")
	elif dire_av == -1:
		input_vector.x -= 1
		if  is_on_wall() && is_on_ground: 
#			if is_on_ground :
			get_node("AnimatedSprite").flip_h = true
			position.x = position.x + 5
			dire_av = -dire_av
		
#	if  is_on_wall(): 
#		dire_av = -dire_av
#	if Input.is_action_pressed("move_right"):
#		input_vector.x += 1
#	if Input.is_action_pressed("move_left"):
#		input_vector.x -= 1

	# Aplicar gravedad
	velocity.y += gravity * delta

	# Aplicar movimiento horizontal
	velocity.x = input_vector.x * speed

	# Mover el personaje
	velocity = move_and_slide(velocity, Vector2(0, -1))

	# Muerte del personaje por caida
	if position.y > 500:
#		get_node("tempoGO/hud/Label").set_text("Muerte por bajo nivel")
#		get_node("tempoGO/TimerGO").start(3)
		if(!get_node("tempoGO").go):
			get_node("tempoGO/TimerGO").start(0.5)
			get_node("tempoGO/hud/Label").set_text("Game Over por caida")
			get_node("tempoGO").go = true
			print("muere por ")

func salto (fuerza):
#	print("salto con ", fuerza)
	velocity.y  = fuerza
