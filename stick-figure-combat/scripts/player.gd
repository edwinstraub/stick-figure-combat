extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_force: float = -500.0
@export var gravity: float = 1200.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	move_and_slide()
