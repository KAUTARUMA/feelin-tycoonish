extends Buyable

func _on_buy():
	for background in Game.backgrounds:
		if background.name == "Fat":
			background.music.play()
