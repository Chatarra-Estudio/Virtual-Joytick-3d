extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout", self, "_mi_funcion_tiempo")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	print(body.name)
	get_node("Particles").emitting = true
	get_node("CSGMesh").hide()
	print("muerte por pariculas")
	timer.start(1)
	pass # Replace with function body.
	
func _mi_funcion_tiempo():
	if(get_parent().get_child_count() == 1):
		print(" el último muere enemigo")
	queue_free()
	
