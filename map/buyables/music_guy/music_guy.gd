extends Buyable

@export var songs: Array[AudioStream] = []

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $MusicGuy/AudioStreamPlayer2D

func _on_buy():
	while true:
		audio_stream_player_2d.stream = songs.pick_random()
		audio_stream_player_2d.play()
		await audio_stream_player_2d.finished
