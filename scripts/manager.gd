extends Node

var timer
var end_screen = false
var who_done_it = false

@onready var scream_audio = $"Scream"
var scream = preload("res://sound_effects/screamlonger.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	if who_done_it == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if (timer.time_left - 1) <= 1 && end_screen == false:
		who_did_it()

func who_did_it():
	who_done_it = true
	scream_audio.stream = scream
	scream_audio.play()
	end_screen = true
	$EndGame.set_visible(true)
	var lose = false
	if lose == true:
		$EndGame.set_visible(false)
		who_done_it = false
		end_screen = false
		pass

func game_lost():
	$EndGame.set_visible(false)
	end_screen = false
	who_done_it = false
	$"../Player".position = $"../Player".start_loc 
	$"../Player".rotation = $"../Player".start_rot
	$"../Player/AnimationHandling/Control/ClockAnim".play("clock")
	for character in $"../Characters".get_children():
		character.position = character.start_loc
		character.timer.start()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	timer.start()
