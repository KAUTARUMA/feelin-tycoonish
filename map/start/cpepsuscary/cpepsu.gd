extends Sprite2D

@onready var talking_speech_bubble: TalkingSpeechBubble = $TalkingSpeechBubble

func _on_talk_hitbox_body_entered(body: Node2D) -> void:
	if body == Game.player && !talking_speech_bubble.talking:
		talking_speech_bubble.say("You dont wanna buy this... Its effed up...", 1.0 / 30.0, 1)
