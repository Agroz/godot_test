
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Enemy_area_enter( area ):
	if(area.get_name() == "Ship"):
		area.die()
	if(area extends preload("res://shot.gd")):
		queue_free()
		area.queue_free()
	pass # replace with function body
