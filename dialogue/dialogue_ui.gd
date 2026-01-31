extends CanvasLayer

var dialogue_resource = load('res://dialogue/test_dialogue.dialogue')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")
