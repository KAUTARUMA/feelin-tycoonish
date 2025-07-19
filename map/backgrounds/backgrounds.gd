extends Node2D

const FADE_LENGTH = 1.0

const AUDIO_MUTE = -80.0
const AUDIO_MAX = -5.0

var fade_tween: Tween

var backgrounds: Array[Background]

func _ready() -> void:
	for child in get_children():
		if child is Background:
			backgrounds.append(child)
	
	for background in backgrounds:
		background.music.volume_db = AUDIO_MUTE
		
		if background.name != "Start":
			background.self_modulate.a = 0
	
	Game.backgrounds = backgrounds
	
	Game.area_changed.connect(_fade_all_bgs)

func _fade_all_bgs(bg_name: String):
	if fade_tween != null:
		fade_tween.kill()
	
	fade_tween = create_tween()
	
	for background in backgrounds:
		background.visible = true
		
		var target = 0.0 if background.name != bg_name else 1.0
		
		fade_tween.parallel().tween_property(background, "self_modulate", Color(
			1.0,
			1.0,
			1.0,
			target
		), FADE_LENGTH)
		
		if background.music != null:
			fade_tween.parallel().tween_property(background.music, "volume_db", 
				remap(target, 0, 1, AUDIO_MUTE, AUDIO_MAX)
			, FADE_LENGTH)
		
		fade_tween.finished.connect(func():
			if target == 0.0:
				background.visible = false
		)
