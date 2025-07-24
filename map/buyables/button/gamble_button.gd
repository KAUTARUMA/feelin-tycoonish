class_name GambleButton
extends BuyableButton
# button that cycles between a min and max price

@export var min_price = 0
@export var max_price = 100

@export var cycle_time = 0.35

func _ready():
	while true:
		price = randi_range(min_price, max_price)
		await get_tree().create_timer(cycle_time).timeout
