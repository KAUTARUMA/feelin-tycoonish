extends Sprite2D

var time = 0.0
@onready var talking_speech_bubble: TalkingSpeechBubble = $TalkingSpeechBubble
func _process(delta: float) -> void:
	time += delta * (4 if talking_speech_bubble.talking else 1)
	scale = Vector2.ONE
	scale += Vector2(sin(time * 3), -sin(time * 3)) * 0.05
	scale *= 0.75

func _on_talk_hitbox_body_entered(body: Node2D) -> void:
	if body == Game.player && !talking_speech_bubble.talking:
		talking_speech_bubble.say("im ganbling!!", 1.0 / 15.0, 2)
