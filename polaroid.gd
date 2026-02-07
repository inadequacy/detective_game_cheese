extends Sprite2D

@export var murderer = false
var text_out
var manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manager = $"../../.."
	text_out=$"../Label"
	pass # Replace with function body.


func _on_button_pressed() -> void:
	if murderer == true:
		text_out.text = "You won"
		$"../../AnimationPlayer".play("win_fade")
		await $"../../AnimationPlayer".animation_finished
		print_debug("You won")
	else:
		text_out.text = "You lost"
		$"../../AnimationPlayer".play("end_game_fade")
		await $"../../AnimationPlayer".animation_finished
		manager.game_lost()
		text_out.text = "Who's done it?"
		await get_tree().create_timer(1).timeout
