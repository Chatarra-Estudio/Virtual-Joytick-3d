extends KinematicBody2D

# Propiedades de movimiento
var speed = 200  # Velocidad de movimiento
var jump_force = -400  # Fuerza de salto
var gravity = 800  # Gravedad
var is_on_ground = false  # Bandera para verificar si el personaje está en el suelo
var velocity = Vector2()  # Vector de velocidad
var input_vector = Vector2()
func _ready():
	pass  # Puedes inicializar cosas aquí si es necesario

func _physics_process(delta):
	# Obtener la entrada del jugador
	input_vector = Vector2(0,0)
	

	if Input.is_action_pressed("move_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_left"):
		input_vector.x -= 1

	# Aplicar gravedad
	velocity.y += gravity * delta

	# Aplicar movimiento horizontal
	velocity.x = input_vector.x * speed

	# Mover el personaje
	velocity = move_and_slide(velocity, Vector2(0, -1))

	# Detección de colisión con el suelo
	is_on_ground = is_on_floor()

	# Saltar tecla space
	if is_on_ground && Input.is_action_just_pressed("jump"):
#	if is_on_ground:
		velocity.y = jump_force
