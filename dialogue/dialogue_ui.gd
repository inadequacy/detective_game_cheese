extends CanvasLayer

var dialogue_resource = load('res://dialogue/base.dialogue')

var dialogue_state: Dictionary = {
	speaking_to = "peacock",
	facts = {},
	peacock = {
		has_met = false
	},
	horse = {
		has_met = false
	},
	plague = {
		has_met = false
	},
	pidgeon = {
		has_met = false
	},
	angler = {
		has_met = false
	},
	big_cheese = {
		has_met = false
	},
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func talk_to(who: String) -> void:
	dialogue_state.speaking_to = who
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start", [dialogue_state])

# Good for triggering character animations
func play_animation() -> void:
	print('test')
