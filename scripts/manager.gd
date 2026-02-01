extends Node

var timer
var end_screen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	timer.start()

var time_passed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	time_passed = 120 - timer.time_left
	if time_passed >= 120 && end_screen == false:
		who_did_it()

func who_did_it():
	end_screen = true
	$EndGame.set_visible(true)
	var lose = false
	if lose == true:
		$EndGame.set_visible(true)
		end_screen == false
		pass
