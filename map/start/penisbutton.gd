extends Node2D
@onready var talking_speech_bubble: TalkingSpeechBubble = $TalkingSpeechBubble
var buttonPoom = 0

func _on_button_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# dont continue code if this isnt a mouse button event
	if event is not InputEventMouseButton: return
	if talking_speech_bubble.talking: return
	# if its a press event, and the button is the left mouse button (1)
	if event.pressed && event.button_index == 1:
		buttonPoom +=1
		if buttonPoom > 4:
			await talking_speech_bubble.say("i warn you i warn you you did not heed", 0.03, 1)
			Game.kill_player()
		else:
			talking_speech_bubble.say("please do not do that", 0.03, 0.5)
		
