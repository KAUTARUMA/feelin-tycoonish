extends Sprite2D

func _process(_delta: float) -> void:
	scale = Vector2.ONE
	scale += Vector2(sin(Time.get_ticks_msec() / 300.), -sin(Time.get_ticks_msec() / 300.)) * 0.1
	scale *= 0.75
