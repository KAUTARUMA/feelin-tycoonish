extends Buyable
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var fries: Node2D

func _on_buy(): 
	create_tween().tween_property(self, "scale", Vector2(1, 5), 5.63)
	var t = create_tween()
	t.tween_property(self, "position", Vector2(position.x, position.y + 480), 5.63)
	t.tween_callback(_hi_fries)
	audio_stream_player_2d.play()

func _hi_fries():
	fries.visible = true
	fries.scale = Vector2(10, 0)
	var t = create_tween()
	t.set_ease(Tween.EASE_OUT)
	t.set_trans(Tween.TRANS_BACK)
	t.tween_property(fries, "scale", Vector2(1, 1), .5)
