
extends Area2D

const SPEED = 200

var live = true
var prev_shoot = false

func die():
	if(live):
		get_node("explo").set_emitting(true)
		get_node("Sprite").hide()
		live = false
	pass

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	var dir = Vector2()
	
	if(Input.is_action_pressed("move_down")):
		dir += Vector2(0,1)
	if(Input.is_action_pressed("move_up")):
		dir += Vector2(0,-1)
	if(Input.is_action_pressed("move_left")):
		dir += Vector2(-1,0)
	if(Input.is_action_pressed("move_right")):
		dir += Vector2(1,0)
	
	var shoot = Input.is_action_pressed("fire")
	
	var pos = get_pos()
	pos += dir * delta * SPEED
	
	var borders = get_viewport_rect().size
	
	pos.x = clamp(pos.x, 0, borders.x)
	pos.y = clamp(pos.y, 0, borders.y)

	set_pos(pos)
	
	if(shoot and not prev_shoot and live):
		var shoot = preload("res://shot.scn")
		var shoot_scene = shoot.instance()
		shoot_scene.set_pos( pos )
		get_parent().add_child( shoot_scene )
		
	prev_shoot = shoot
