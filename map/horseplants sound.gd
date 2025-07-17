extends Area2D

@onready var horse_player: AudioStreamPlayer2D = $"horse player"
func _on_body_entered(body: Node2D) -> void:
	if body == Game.player:
		horse_player.play()
