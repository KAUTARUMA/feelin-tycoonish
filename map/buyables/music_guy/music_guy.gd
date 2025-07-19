extends Buyable

@export var songs: Array[AudioStream] = []

func _on_buy():
	var start_background: Background
	
	for background in Game.backgrounds:
		if background.name == "Start":
			start_background = background
	
	while true:
		start_background.music.stream = songs.pick_random()
		start_background.music.play()
		await start_background.music.finished
