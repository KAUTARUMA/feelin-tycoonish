extends Area2D

# cinder cinder cinder i made you out of clay! cinder cinder cinder with cinder i will play!
#btw thats my cinder remix of dreidel song by jew
#for my next song, i will turn water into funk!
@onready var marker_2d = $Marker2D

func _process(_delta):
	if Input.is_action_just_pressed("player_interact") and overlaps_body(Game.player):
		Game.player.position = marker_2d.global_position
