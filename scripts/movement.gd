extends CharacterBody3D

@export var speed = 9
@export var rotation_speed = 2
var journal = false
var animator

func _ready() -> void:
	animator = $AnimationHandling/AnimationPlayer
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _physics_process(delta):
	if journal == false:
		var forward = -global_transform.basis.z
		if Input.is_action_pressed("rotate_right"):
			rotation.y -= rotation_speed * delta
		if Input.is_action_pressed("rotate_left"):
			rotation.y += rotation_speed * delta
		if Input.is_action_pressed("move_forward"):
			velocity = (forward * speed)
			move_and_slide()
			animator.play("walking")
		else:
			animator.pause()
		if Input.is_action_pressed("move_backward"):
			velocity = (-forward * speed / 1.7)
			move_and_slide()

	if Input.is_action_just_released("journal"):
		if journal == false:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			journal = true
		else:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			journal=false
