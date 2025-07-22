extends Node2D

const PLINKO_BALL = preload("res://map/buyables/plinko/plinko_ball.tscn")
const SPEED = 100 # pixels a second

@onready var balls: Node2D = $"../../../Balls"

@onready var dropper_follow: PathFollow2D = $".."
@onready var dropper_marker: Marker2D = $DropperMarker

func _ready() -> void:
	Game.spawn_plinko_ball.connect(_spawn_ball)

func _process(delta: float) -> void:
	dropper_follow.progress += delta * SPEED

func _spawn_ball():
	var ball = PLINKO_BALL.instantiate()
	
	ball.position = balls.to_local(dropper_marker.global_position)
	balls.add_child(ball)
