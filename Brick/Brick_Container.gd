extends Node2D

# This method is responsible for calling the splash animation that occurs when a brick is hit
func splash(hit_position, intensity):
	for brick in self.get_children():
		# Calls splash for NE, NW, SE, and SW - otherwise these will only get a North or South splash, and we want a diagonal
		if brick.global_position.x == hit_position.x + 100 and brick.global_position.y == hit_position.y - 40:
			brick.splash_animation(Vector2(1,-1), intensity/2)
		if brick.global_position.x == hit_position.x - 100 and brick.global_position.y == hit_position.y - 40:
			brick.splash_animation(Vector2(-1,-1), intensity/2)
		if brick.global_position.x == hit_position.x + 100 and brick.global_position.y == hit_position.y + 40:
			brick.splash_animation(Vector2(1,1), intensity/2)
		if brick.global_position.x == hit_position.x - 100 and brick.global_position.y == hit_position.y + 40:
			brick.splash_animation(Vector2(-1,1), intensity/2)
		
		# Calls splash for North, South, East, and West, listed in that order
		if brick.global_position.x == hit_position.x and brick.global_position.y == hit_position.y - 40:
			brick.splash_animation(Vector2(0,-1), intensity)
		if brick.global_position.x == hit_position.x and brick.global_position.y == hit_position.y + 40:
			brick.splash_animation(Vector2(0,1), intensity)
		if brick.global_position.x == hit_position.x + 100 and brick.global_position.y == hit_position.y:
			brick.splash_animation(Vector2(1,0), intensity)
		if brick.global_position.x == hit_position.x - 100 and brick.global_position.y == hit_position.y:
			brick.splash_animation(Vector2(-1,0), intensity)
	

func check_level():
	var count = 0
	for c in get_children():
		if not c.dying:
			count += 1
	if count == 0:
		Global.next_level()
