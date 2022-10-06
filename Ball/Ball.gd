extends RigidBody2D

var min_speed = 100.0
var max_speed = 600.0
var accelerate = false
var decay = 0.04

func _ready():
	contact_monitor = true
	contacts_reported = 8
	if Global.level < 0 or Global.level >= len(Levels.levels):
		Global.end_game(true)
	else:
		var level = Levels.levels[Global.level]
		min_speed *= level["multiplier"]
		max_speed *= level["multiplier"]
	

func _on_Ball_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		accelerate = true
	
	
func _integrate_forces(state):
	comet()
	if position.y > Global.VP.y + 100:
		die()
	if accelerate:
		state.linear_velocity = state.linear_velocity * 1.1
		accelerate = false
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed

func die():
	var fall_sound = get_node_or_null("/root/Game/Fall_Sound")
	if fall_sound != null:
		fall_sound.play()
	var score = get_node_or_null("/root/Game/UI/HUD/Floating_Score")
	if score != null:
		score.reset()
	Global.update_lives(-1)
	queue_free()

func comet():
	var comet_container = get_node_or_null("/root/Game/Comet_Container")
	if comet_container != null:
		var sprite = $Trail_Sprite.duplicate()
		sprite.show()
		sprite.global_position = global_position
		comet_container.add_child(sprite)
