extends Sprite3D

var active = false
@export var reversible = true
var open = false
var done_playing = false
var was_interacted = true
@onready var animator = $"../../AnimationPlayer"

func _process(delta):
	if active and not open and not done_playing:
		open = true
		animator.play("door_open")
		active = true
	elif not active and open and not done_playing:
		open = false
		animator.play_backwards("door_open")
		active = false
	else:
		done_playing == true

func interact():
	done_playing == false
	if active and reversible:
		active = false
	elif not active:
		active = true
