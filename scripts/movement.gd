extends CharacterBody3D

@export var speed = 6
@export var rotation_speed = 1.5
var journal = false

func _physics_process(delta):
	if journal == false:
		var forward = -global_transform.basis.z
		if Input.is_action_pressed("strafe_right"):
			rotation.y -= rotation_speed * delta
		if Input.is_action_pressed("strafe_left"):
			rotation.y += rotation_speed * delta
		if Input.is_action_pressed("move_forward"):
			velocity = (forward * speed)
			move_and_slide()
		if Input.is_action_pressed("move_backward"):
			velocity = (-forward * speed / 1.7)
			move_and_slide()
			
			
	if Input.is_action_just_released("journal"):
		
		
		if journal == false:
			journal = true
			
		else:
			journal=false
		
		
		
