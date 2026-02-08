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
		big_cheese_loves_ella = {
			known = false,
			content = "Big Cheese loves Ella."
		},
		butler_knife = {
			known = false,
			content = "Butler puts a knife on every cheese tray"
		},
		butler_stilton = {
			known = false,
			content = "Stilton broke into the study"
		},
		cheese_addict_addicted = {
			known = false,
			content = "Hal is addicted to cheese"
		},
		cheese_addict_ella = {
			known = false,
			content = "Ella arguing in the study"
		},
		femme_fish_fatale_collude = {
			known = false,
			content = "Ella wants a private word with Big Cheese"
		},
		femme_fish_fatale_next_cheese = {
			known = false,
			content = "Ella wants to be the next Big Cheese"
		},
		merchant_sold_to_big_cheese = {
			known = false,
			content = "Big Cheese is Brie's number 1 customer",
		},
		merchant_needs_business = {
			known = false,
			content = "Brie's business has troubles",
		},
		plod_knows_about_secret_pathway = {
			known = false,
			content = "Stilton knows about a secret pathway in the closet",
		},
		plod_knife_safe = {
			known = false,
			content = "Plod bent a cheese knife trying to open the safe",
		},
		rosh_swapped_masks = {
			known = false,
			content = "Roch swapped masks with Wensley"
		},
		rosh_stilton_knife = {
			known = false,
			content = "Stilton searching for a knife"
		},
		ford_new_twin = {
			known = false,
			content = "twins were Cheese Ball's newest members"
		},
		ford_hate = {
			known = false,
			content = "Ford hates Big Cheese"
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
		Rosh = {
			has_met = false
		},
		Ford = {
			has_met = false
		},
	}
}

# Good for triggering character animations
func play_animation() -> void:
	print('test')
