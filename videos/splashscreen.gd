extends Node2D

var interact_count = 0

func _ready():
	$VideoStreamPlayer.play()

func _process(_delta):
	if Input.is_anything_pressed() and interact_count == 0:
		set_process_input(false)
		$Owl.visible = true
		await get_tree().create_timer(1).timeout
		interact_count = 1
		set_process_input(true)
	elif Input.is_anything_pressed() and interact_count == 1:
		set_process_input(false)
		$Letter.visible = true
		await get_tree().create_timer(1).timeout
		interact_count = 2
		set_process_input(true)
	elif Input.is_anything_pressed() and interact_count == 2:
		# play animation
		set_process_input(false)
		$Letter.position = Vector2(0, 0)
		await get_tree().create_timer(2).timeout
		interact_count = 3
		set_process_input(true)
	elif Input.is_anything_pressed() and interact_count == 3:
		load("res://scene.tscn")
