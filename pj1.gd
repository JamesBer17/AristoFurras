extends KinematicBody2D

var speed = 150
var velocity = Vector2.ZERO
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
		animated_sprite.play("MoveLeft")
	elif velocity.x > 0:
		animated_sprite.play("MoveRight")
	elif velocity.y < 0:
		animated_sprite.play("MoveUp")
	elif velocity.y > 0:
		animated_sprite.play("MoveDown")
	else:
		animated_sprite.play("Idle")
