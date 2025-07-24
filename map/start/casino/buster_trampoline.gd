extends Node2D

@export var UPWARDS_VELOCITY = -1600

@onready var label = $Label
@onready var audio_player = $AudioPlayer

func _ready():
	while true:
		label.modulate.a = 1.0 - label.modulate.a
		await get_tree().create_timer(0.25).timeout

func _on_area_2d_body_entered(body):
	if body.velocity.y < 0 :
		return
	
	body.velocity.y = UPWARDS_VELOCITY
	
	audio_player.stop()
	audio_player.play()
