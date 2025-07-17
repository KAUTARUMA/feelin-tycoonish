extends Sprite2D

func _process(_delta: float) -> void:
	rotation_degrees = sin(Time.get_ticks_msec()/ 100.0) * 5
