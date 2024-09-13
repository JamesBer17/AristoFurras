extends Sprite

var is_dragging = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				is_dragging = true
		else:
			is_dragging = false

	if event is InputEventMouseMotion and is_dragging:
		global_position = event.position

# Añadir más comportamiento si es necesario (como soltar la poción en el lugar correcto)
