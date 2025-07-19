extends Node2D

var starting_position: Vector2

func _ready():
	starting_position = self.position # so you can move it in the editor
	
	# basically a forever loop. be careful, if these get stuck the game will freeze!
	# use "break" to exit out of them
	while true:
		# wait before walking
		
		$AnimationPlayer.play ("IdleLook")
		
		await get_tree().create_timer(3.0).timeout
		scale.x *= -1
		
		# creates a tween
		var tween = create_tween()
		
		# tweens the position variable to starting_position + Vector2(50, 0) over 3 (now 5) seconds
		# tween instances cannot be reused once they have been started,
		# make sure to recreate them by doing `tween = create_tween()`!
		tween.tween_property(self, "position", starting_position + Vector2(500, 0), 5.0)
		$AnimationPlayer.play ("Walking")
		# wait for the tween to finish...
		await tween.finished
		
		# wait before walking
		
		$AnimationPlayer.play ("IdleLook")
		
		await get_tree().create_timer(3.0).timeout
		scale.x *= -1
		
		# the tween instance has become stale, we must make a new one
		# stale = its gross and moldy, dont eat it. ew.
		tween = create_tween()
		tween.tween_property(self, "position", starting_position, 5.0)
		$AnimationPlayer.play ("Walking")
		await tween.finished
