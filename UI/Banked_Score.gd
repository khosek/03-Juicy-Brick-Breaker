extends Label

var total_score = 0
var displayed_score = 0

func _ready():
	pass

func _physics_process(_delta):
	if displayed_score < total_score:
		displayed_score += 10
		if displayed_score > total_score:
			displayed_score = total_score
		text = "Score: " + str(displayed_score)
