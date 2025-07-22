extends Sprite2D

var dragging = false
var mouse_pose_offset = Vector2(0,0)

func _process(_delta):
	if dragging: 
		position = get_global_mouse_position()/0.75 - mouse_pose_offset 

func _on_button_button_down():
	dragging = true
	mouse_pose_offset = get_global_mouse_position()/0.75 - position

func _on_button_button_up():
	dragging = false
