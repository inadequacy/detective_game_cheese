extends CanvasLayer

var dialogue_resource = load('res://dialogue/base.dialogue')

var dialogue_state: Dictionary = {
	speaking_to = "peacock",
	facts = {
		fact_1 = {
			known = false,
			content = "This is a fact"
		},
		fact_2 = {
			known = true,
			content = "This is a fact"
		},
		fact_3 = {
			known = true,
			content = "This is a fact"
		}
	},
	
	npcs = {
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
}

# Good for triggering character animations
func play_animation() -> void:
	print('test')
