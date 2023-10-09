extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = Timer.new()
#var direccion_al_jugador
var player 
var enemigo

#var velocidad_de_giro = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout", self, "_mi_funcion_tiempo")
	get_node("win").hide()
	
	 # giro
	player = get_parent().get_parent().get_parent().get_node("CaracBase")
#	print(player)
	enemigo = get_node(".")
#	print(enemigo)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if player:
		# Obtén la posición del jugador y del enemigo en el mismo plano horizontal
		var jugador_pos = Vector3(player.global_transform.origin.x, global_transform.origin.y, player.global_transform.origin.z)
		var enemigo_pos = global_transform.origin
#		calcula direccion 
		var direccion_al_jugador = (jugador_pos - enemigo_pos).normalized()
		# Obtén la rotación actual del enemigo en el eje vertical
		var rotacion_actual = global_transform.basis.get_euler().y
		
		# Calcula la rotación deseada en el eje vertical
		var rotacion_deseada = atan2(direccion_al_jugador.x, direccion_al_jugador.z)
		# Interpola la rotación actual hacia la rotación deseada gradualmente
		var velocidad_de_giro = 2.0 # Ajusta la velocidad de giro según tus preferencias
		rotacion_actual = lerp_angle(rotacion_actual, rotacion_deseada, delta * velocidad_de_giro)
		# Aplica la nueva rotación solo en el eje vertical
		var nueva_rotacion = Vector3(0, rotacion_actual, 0)
		global_transform.basis = Basis(nueva_rotacion)
	
#	prueba giro raro
#	direccion_al_jugador = (player.global_transform.origin - global_transform.origin).normalized()
#
#	look_at(global_transform.origin + direccion_al_jugador, Vector3(0, 1, 0))
##	print(direccion_al_jugador)
#	enemigo.rotation = enemigo.rotation.slerp((direccion_al_jugador), delta * velocidad_de_giro)
##	print(enemigo.rotation)
	pass




func _on_Area_body_entered(body):
	print(body.name)
	get_node("Particles").emitting = true
	get_node("CSGMesh").hide()
	print("muerte por pariculas")
	timer.start(1)
	player.get_node("tempoGO/hud/Label").set_text("+ 500 puntos")
	print("sprite ",get_node("win"))
	pass # Replace with function body.
	
func _mi_funcion_tiempo():
	if(get_parent().get_child_count() == 1):
		var win 
		win = get_node("win").duplicate()
		player.get_node("tempoGO/hud/Label").set_text("You Win, máquina")
		get_parent().add_child(win)
		win.show()
		player.get_node("tempoGO").go = true
		player.get_node("tempoGO/TimerGO").start(3)
		print(" el último muere enemigo")
	queue_free()
	


