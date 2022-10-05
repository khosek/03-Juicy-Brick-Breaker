extends Node2D


func _ready():
	pass

func _physics_process(_delta):
	for c in get_children():
		if c.modulate.v <= 0:
			c.queue_free()
		c.scale *= 0.95
		c.modulate.v -= 0.05
