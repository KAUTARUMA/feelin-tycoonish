extends Sprite2D

@onready var talking_speech_bubble: TalkingSpeechBubble = $TalkingSpeechBubble

func _on_talk_hitbox_body_entered(body: Node2D) -> void:
	if body == Game.player && !talking_speech_bubble.talking:
		talking_speech_bubble.say("Hey Guys, I'm Zach Fazbear!", 1.0 / 30.0, 1)
