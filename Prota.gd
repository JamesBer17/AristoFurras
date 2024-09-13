extends KinematicBody2D

var speed = 150
var velocity = Vector2.ZERO
var last_direction = "Idle"  # Variable para guardar la última dirección
onready var animated_sprite = $AnimatedSprite

func _physics_process(delta):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction_x * speed
	
	var direction_y = Input.get_axis("ui_up", "ui_down")
	velocity.y = direction_y * speed
	
	move_and_slide(velocity)
	animacion()

	# Aplicar suavemente la desaceleración cuando no se presiona ninguna tecla
	if direction_x == 0:
		velocity.x = move_toward(velocity.x, 0, speed * delta)
	if direction_y == 0:
		velocity.y = move_toward(velocity.y, 0, speed * delta)

func animacion():
	if velocity.x < 0:
		animated_sprite.play("Left")
		last_direction = "Left"
	elif velocity.x > 0:
		animated_sprite.play("Right")
		last_direction = "Right"
	elif velocity.y < 0:
		animated_sprite.play("Up")
		last_direction = "Up"
	elif velocity.y > 0:
		animated_sprite.play("Down")
		last_direction = "Down"
	else:
		# este es pa mostrar la animación IdleUp si la 
		# última dirección es hacia arriba
		if last_direction == "Up":
			animated_sprite.play("IdleUp")
		else:
			animated_sprite.play("Idle")
		
