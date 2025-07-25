extends Sprite2D
# why does ghibli food taste so good?
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var start_y = position.y
@onready var talking_speech_bubble: TalkingSpeechBubble = $TalkingSpeechBubble

# voicelines 
var gum_1 = preload("res://map/hell/Gums Speech SFX/gumspeech1.mp3")
var gum_2 = preload("res://map/hell/Gums Speech SFX/gumspeech2.mp3")
var gum_3 = preload("res://map/hell/Gums Speech SFX/gumspeech3.mp3")
var gum_4 = preload("res://map/hell/Gums Speech SFX/gumspeech4.mp3")
var gum_5 = preload("res://map/hell/Gums Speech SFX/gumspeech5.mp3")
var gum_6 = preload("res://map/hell/Gums Speech SFX/gumspeech6.mp3")
var gum_7 = preload("res://map/hell/Gums Speech SFX/gumspeech7.mp3")
var gum_8 = preload("res://map/hell/Gums Speech SFX/gumspeech8.mp3")
var gum_9 = preload("res://map/hell/Gums Speech SFX/gumspeech9.mp3")

var cancelled = false
var listened = false

# floating
func _process(_delta: float) -> void:
	position.y = start_y + sin((Time.get_ticks_msec() / 1000.) * 1) *100


# his fucking dialogueddd
func _on_talk_hitbox_body_entered(body: Node2D) -> void:
	if listened: return
	
	cancelled = false
	
	if body == Game.player && !talking_speech_bubble.talking:
		$AudioStreamPlayer2D.stream = gum_1
		$AudioStreamPlayer2D.play()
		talking_speech_bubble.say("Wait, Felix.
Let me tell you about a story.", 1.0 / 30.0, 1)
		await $AudioStreamPlayer2D.finished
		
		$AudioStreamPlayer2D.stream = gum_2
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
		
		print("1 2")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_3
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("On a sunny evening 
just like any other.
A rising businessman invested
all his money into
Banana-Walkers.", 1.0 / 30.0, 2.5)
		
		print("3")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_4
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("The businessman 
had the people 
inside the walkers 
work day in and day out.", 1.0 / 30.0, 1.3)
		
		print("4")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_5
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("Months later, 
his cruel and unusual treatment
of his workers
had finally materialized.", 1.0 / 30.0, 2)
		
		print("5")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_6
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("The businessman had fallen 
into the underworld,
where he could hurt
his employees no longer.", 1.0 / 30.0, 1.5)
		
		print("6")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_7
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("His employees vowed 
to never let a man
like him come into power again, 
so they invented a new 
type of walker.", 1.0 / 30.0, 2.5)
		
		print("7")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_8
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("You've fallen here too,
but I can only assume 
by the look of 
your green face, 
you did not end up 
like the businessman. ", 1.0 / 30.0, 2.5)
		
		print("8")
		
		if cancelled: return
		
		$AudioStreamPlayer2D.stream = gum_9
		$AudioStreamPlayer2D.play()
		await talking_speech_bubble.say("Up ahead is a farm 
with many horses, 
run by a kind soul 
like yourself. 
I suggest you greet her.", 1.0 / 30.0, 3)
		
		listened = true


func _on_talk_hitbox_body_exited(body: Node2D) -> void:
	if body == Game.player:
		cancelled = true
