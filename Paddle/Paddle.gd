extends KinematicBody2D

var target = Vector2.ZERO
export var speed = 10.0
var width = 0
var decay = 0.02

func _ready():
	width = $CollisionShape2D.get_shape().get_extents().x
	target = Vector2(Global.VP.x / 2, Global.VP.y - width)

func _physics_process(_delta):
	target.x = clamp(target.x, 0, Global.VP.x - 2*width)
	position = target

func _input(event):
	if event is InputEventMouseMotion:
		target.x += event.relative.x

func hit():
	var bank_sound = get_node_or_null("/root/Game/Bank_Sound")
	if bank_sound != null:
		bank_sound.play()
	# Banking score
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.bank_score()
