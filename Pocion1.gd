extends Area2D

var is_dragging = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
		else:
			is_dragging = false

	if event is InputEventMouseMotion and is_dragging:
		global_position = event.position
