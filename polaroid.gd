extends Sprite2D

@export var murderer = false
var text_out
var manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manager = $"../../.."
	pass # Replace with function body.
	text_out=$"../Label"


func _on_button_pressed() -> void:
	if murderer == true:
		text_out.text="You won"
		print_debug("You won")
	else:
		text_out.text="You lost"
		await get_tree().create_timer(3).timeout
		manager.game_lost()
		print_debug("You lost")
