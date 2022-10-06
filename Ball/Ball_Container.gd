extends Node2D

var Ball = null
var num_balls = 1

func _ready():
	Ball = load("res://Ball/Ball.tscn")
	make_ball()

func _physics_process(_delta):
	if get_child_count() < num_balls:
#		Global.update_lives(-1)
		make_ball()

func make_ball():
	var ball = Ball.instance()
	ball.position = Vector2(Global.VP.x/2, Global.VP.y - 100)
	var direction = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	ball.apply_central_impulse(direction)
	add_child(ball)
	
