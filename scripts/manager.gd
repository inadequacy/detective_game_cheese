extends Node

var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	timer.start()

var time_passed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	time_passed = 120 - timer.time_left
	if time_passed >= 3:
		who_did_it()

func who_did_it():
	$EndGame.set_visible(!$EndGame.is_visible)
	print($EndGame.is_visible)
	var lose = false
	if lose:
		#reset pls
		pass
