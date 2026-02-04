extends CharacterBody3D

@export var speed = 9.1
@export var rotation_speed = 2
var journal = false
var animator
var audio_player
var was_pressed = false
var start_loc

func _ready() -> void:
	animator = $AnimationHandling/AnimationPlayer
	audio_player=$AnimationHandling/AnimationPlayer/AudioStreamPlayer
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	start_loc = position

func _physics_process(delta):
	# Movement
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
			if was_pressed == false:
				audio_player.play()
				was_pressed = true
		else:
			animator.pause()
			audio_player.stop()
			was_pressed = false
		if Input.is_action_pressed("move_backward"):
			velocity = (-forward * speed / 1.7)
			move_and_slide()
	# Journal
	if Input.is_action_just_released("journal"):
		if journal == false:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			journal = true
		else:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			journal=false
	# F to Pay Respect
	for body in $InteractionTrigger.get_overlapping_bodies():
		if body.is_in_group("interactable"):
			if Input.is_action_just_pressed("to_pay_respect"):
				print("happened 2")
				body.get_parent().interact()
