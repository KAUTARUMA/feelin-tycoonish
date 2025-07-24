@tool
extends "res://map/buyables/button/text_name.gd"

func _process(_delta: float) -> void:
	super(_delta)
	if Engine.is_editor_hint():
		price.text = "%s$ - %s$" % [buyable_button.min_price, buyable_button.max_price]
