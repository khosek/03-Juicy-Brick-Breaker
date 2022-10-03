extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false
var splash_strength = 10.0
var animation_time = 0.5

var colors = [
	Color8(0, 0, 255),
	Color8(0, 81, 255),
	Color8(0, 94, 243),
	Color8(0, 93, 190),
	Color8(0, 88, 127),
	Color8(0, 82, 72),
	Color8(0, 76, 31),
	Color8(7, 68, 7)
]

func _ready():
	# Defining color based on points value
	var color_index = (score / 10) - 3
	$ColorRect.color = colors[color_index]
	position = new_position

func _physics_process(_delta):
	if dying:
		queue_free()

func hit():
	var brick_sound = get_node_or_null("/root/Game/Brick_Sound")
	if brick_sound != null:
		brick_sound.play()
	# Calling the splash method
	var brick_container = get_node_or_null("/root/Game/Brick_Container")
	if brick_container != null:
		brick_container.splash(global_position, splash_strength)
	die()

func die():
	dying = true
	collision_layer = 0
	$ColorRect.hide()
	Global.update_score(score)
	get_parent().check_level()

# This function is responsible for the splash animation that occurs when a nearby brick is hit
func splash_animation(direction, intensity):
	# If this was the direct result of the first brick getting hit, cause lighter ripples to occur
	if intensity == splash_strength:
		var brick_container = get_node_or_null("/root/Game/Brick_Container")
		if brick_container != null:
			brick_container.splash(global_position, splash_strength/2)
	
	# Splash animation
	$Tween.interpolate_property(self, "global_position", global_position, Vector2(global_position.x + (direction.x * intensity), global_position.y + (direction.y * intensity)), animation_time/2, Tween.TRANS_CUBIC, Tween.EASE_OUT)
#	$Tween.start()
#	yield(get_tree().create_timer(animation_time/2), "timeout")
	$Tween.interpolate_property(self, "global_position", Vector2(global_position.x + (direction.x * intensity), global_position.y + (direction.y * intensity)), global_position, animation_time/2, Tween.TRANS_CUBIC, Tween.EASE_IN, animation_time/2)
	$Tween.start()
