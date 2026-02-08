extends CharacterBody3D

@export var speed = 9.1
@export var rotation_speed = 2
var journal = false
var animator
var audio_player
var was_pressed = false
var start_loc
var start_rot
var pinboard
var hand_normal = load("res://images/hand_left.png")
var hand_if_f = load("res://images/hand_point.png")

func _ready() -> void:
	animator = $AnimationHandling/AnimationPlayer
	audio_player=$AnimationHandling/AnimationPlayer/AudioStreamPlayer
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	start_loc = position
	start_rot = rotation
	pinboard = get_tree().get_first_node_in_group("pinboard")

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
			journal = false
	# F to Pay Respect
	for body in $InteractionTrigger.get_overlapping_bodies():
		if body.is_in_group("interactable") or body.is_in_group("npc"):
			$AnimationHandling/Hands/LeftHand.texture = hand_if_f
			$AnimationHandling/Hands/RightHand.texture = hand_if_f
		else:
			$AnimationHandling/Hands/LeftHand.texture = hand_normal
			$AnimationHandling/Hands/RightHand.texture = hand_normal
		if body.is_in_group("interactable"):
			if Input.is_action_just_pressed("to_pay_respect"):
				body.get_parent().interact()
				if body.get_parent().was_interacted == false:
					pinboard.spawn_visual_note(body.get_parent().image_note)
					pinboard.spawn_note("Add your text")
					body.get_parent().was_interacted = true
