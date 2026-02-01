extends Sprite2D
@export var murderer = false
var text_out




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	text_out=$"../Label"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if murderer == true:
		
		text_out.text="You won"
		print_debug("You won")
	else:
		text_out.text="You lost"
		print_debug("You lost")
