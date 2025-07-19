extends Area2D

@export var area_name: String

func _on_body_entered(body: Node2D) -> void:
	if body == Game.player:
		Game.area_changed.emit(area_name)
