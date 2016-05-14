
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

const SPEED = 400

func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	translate(Vector2(SPEED * delta, 0))




func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
	pass # replace with function body
