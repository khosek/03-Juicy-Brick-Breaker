extends Label

var total_score = 0
var displayed_score = 0

func _ready():
	pass

func _physics_process(_delta):
	if displayed_score < total_score:
		$Score_Sound.play()
		displayed_score += 2
		if displayed_score > total_score:
			displayed_score = total_score
		text = "+$" + str(displayed_score)
		# Growing animation
		rect_scale = Vector2(rect_scale.x + 0.002, rect_scale.y + 0.002)
		# Setting the position of the rectangle so the text stays in place
		rect_position.x = 210 - (rect_size.x * rect_scale.x)/2
		rect_position.y = 30 - (rect_size.y * rect_scale.y)/2
		if rect_scale.x > 2:
			rect_scale = Vector2(2,2)

func reset():
	$Tween.interpolate_property(self, "rect_scale", rect_scale, Vector2.ZERO, 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.start()
	
	total_score = 0
	displayed_score = 0
#	text = ""
