extends Sprite2D

@onready var talking_speech_bubble: TalkingSpeechBubble = $TalkingSpeechBubble

func _on_talk_hitbox_body_entered(body: Node2D) -> void:
	if body == Game.player && !talking_speech_bubble.talking:
		await talking_speech_bubble.say("Welcome to my Horse Plantation.", 1.0 / 30.0, 1)
		await talking_speech_bubble.say("My name's Feelin Farmin'", 1.0 / 30.0, 1)
		await talking_speech_bubble.say("Go talk to my horses!", 1.0 / 30.0, 1)
