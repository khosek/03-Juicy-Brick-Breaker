extends StaticBody2D

var color_decay = 0.02
var velocity = Vector2.ZERO
var velocity_decay = 0.1
var moving = false
var starting_position = Vector2.ZERO

func _ready():
	starting_position = position

func _physics_process(_delta):
	# Resetting wall color
	if $ColorRect.color.s > 0:
		$ColorRect.color.s -= color_decay
	if $ColorRect.color.v < 1:
		$ColorRect.color.v += color_decay
	# Animating based on velocity
	if moving:
		if name == "Wall_Left":
			position.x -= velocity.x
		elif name == "Wall_Right":
			position.x += velocity.x
		else:
			position.y -= velocity.y
		velocity.x -= velocity_decay
		velocity.y -= velocity_decay
		if velocity.is_equal_approx(Vector2(-1.5,-1.5)):
			moving = false
			position = starting_position

func hit():
	var wall_sound = get_node_or_null("/root/Game/Wall_Sound")
	if wall_sound != null:
		wall_sound.play()
	$ColorRect.color = Color8(0,0,205)
	velocity = Vector2(1.5,1.5)
	moving = true
