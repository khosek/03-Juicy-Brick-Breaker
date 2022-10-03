extends Control

export var indicator_margin = Vector2(25, 15)
export var indicator_index = 25
onready var Indicator = load("res://UI/Indicator.tscn")

func _ready():
	$Banked_Score.text = "Score: 0"
	update_time()
	update_lives()


func update_score(s):
	#$Score.text = "Score: " + str(Global.score)
	$Floating_Score.get_child(1).stop_all()
	$Floating_Score.total_score += s
	if $Floating_Score.rect_scale.x < 1:
		$Floating_Score.rect_scale = Vector2(1,1)

func bank_score():
	Global.score += $Floating_Score.total_score
	$Banked_Score.total_score = Global.score
	$Floating_Score.reset()

func update_time():
	$Time.text = "Time: " + str(Global.time)

func update_lives():
	var indicator_pos = Vector2(indicator_margin.x, Global.VP.y - indicator_margin.y)
	for i in $Indicator_Container.get_children():
		i.queue_free()
	for i in range(Global.lives):
		var indicator = Indicator.instance()
		indicator.position = Vector2(indicator_pos.x + i*indicator_index, indicator_pos.y)
		$Indicator_Container.add_child(indicator)

func _on_Timer_timeout():
	Global.update_time(-1)
