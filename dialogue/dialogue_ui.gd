extends CanvasLayer

var dialogue_resource = load('res://dialogue/base.dialogue')

var dialogue_state: Dictionary = {
	is_speaking = false,
	speaking_to = "",
	facts = {
		big_cheese_retiring = {
			known = false,
			content = "Big Cheese is retiring."
		},
		butler_hates_big_cheese = {
			known = false,
			content = "The Butler secretly hates Big Cheese"
		},
		cheese_addict_saw_twin_brooding = {
			known = false,
			content = "One of the twins was brooding"
		},
		femme_fish_fatale_wants_family = {
			known = false,
			content = "Femme Fish Fatale wants a family with Big Cheese"
		},
		merchant_sold_to_cheese_addict = {
			known = false,
			content = "Merchant sold cheese to Cheese Addict",
		},
		plod_knows_about_secret_pathway = {
			known = false,
			content = "Police Cat knows about a secret pathway in the closet",
		},
	},
	
	npcs = {
		BigCheese = {
			has_met = false
		},
		Butler = {
			has_met = false
		},
		CheeseAddict = {
			has_met = false
		},
		FemmeFishFatale = {
			has_met = false
		},
		Merchant = {
			has_met = false
		},
		PlodStilton = {
			has_met = false
		},
	}
}

# Good for triggering character animations
func play_animation() -> void:
	print('test')
