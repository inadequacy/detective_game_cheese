extends Node2D

var interact_count = 0
var game_start = false
var credits = false
func _ready():
	$VideoStreamPlayer.play()

func _process(_delta):
	if credits == true:
		if Input.is_anything_pressed():
			credits = false
			$CanvasLayer/Credits.visible = false
			$CanvasLayer/credits.visible = true
			$CanvasLayer/play.visible = true
	#
	#if game_start == true:
		#if Input.is_anything_pressed() and interact_count == 0:
			#set_process_input(false)
			#$Owl.visible = true
			#await get_tree().create_timer(1).timeout
			#interact_count = 1
			#set_process_input(true)
		#elif Input.is_anything_pressed() and interact_count == 1:
			#set_process_input(false)
			#$Letter.visible = true
			#await get_tree().create_timer(1).timeout
			#interact_count = 2
			#set_process_input(true)
		#elif Input.is_anything_pressed() and interact_count == 2:
			## play animation
			#set_process_input(false)
			#$Letter.position = Vector2(0, 0)
			#await get_tree().create_timer(2).timeout
			#interact_count = 3
			#set_process_input(true)
		#elif Input.is_anything_pressed() and interact_count == 3:
			#get_tree().change_scene_to_file("res://scene.tscn")

func _on_play_pressed() -> void:
	game_start = true
	$CanvasLayer/credits.visible = false
	$CanvasLayer/play.visible = false
	$AnimationPlayer.play("start_mination")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scene.tscn")

func _on_credits_pressed() -> void:
	credits = true
	$CanvasLayer/Credits.visible = true
	$CanvasLayer/credits.visible = false
	$CanvasLayer/play.visible = false
