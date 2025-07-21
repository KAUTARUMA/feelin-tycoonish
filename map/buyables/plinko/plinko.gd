extends Buyable

@onready var prize_10: Area2D = $PrizeAreas/Prize10
@onready var prize_10_1: Area2D = $PrizeAreas/Prize10_1
@onready var prize_5: Area2D = $PrizeAreas/Prize5


func _ready() -> void:
	super()
	prize_5.body_entered.connect(func(body): _check_and_reward(body, 5))
	prize_10.body_entered.connect(func(body): _check_and_reward(body, 10))
	prize_10_1.body_entered.connect(func(body): _check_and_reward(body, 10))

func _check_and_reward(body: Node2D, prize: int):
	if body.is_in_group("PlinkoBall"):
		Game.money += prize
		_play_coin_sound()
		body.queue_free()
