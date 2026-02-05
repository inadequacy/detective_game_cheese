extends Control

var player
var my_node
var journal_open := false
var manager
var state_d
var book
var book_node
var book_area
@export var note_scene: PackedScene

func _ready() -> void:
	book = $Book/Book
	book_node=$Book
	book_area=$Book/Book/DropZone/CollisionShape2D


func random_point_in_book() -> Vector2:
	var cs := book_area as CollisionShape2D
	var rect := cs.shape as RectangleShape2D
	var half := rect.size * 0.4

	# point in the rectangle's local space
	var p_shape := Vector2(
		randf_range(-half.x, half.x),
		randf_range(-half.y, half.y)
	)

	# transform it through the scene (handles parent scaling/rotation)
	var p_global := cs.to_global(p_shape)

	# return position in book_node's local coordinates (since note is child of book_node)
	return book_node.to_local(p_global)

func spawn_note(text_label):
	var note = note_scene.instantiate()
	note.position = random_point_in_book()
	var label := note.get_node("TexLabel") as Label
	label.text = text_label
	
	book_node.add_child(note)

var pinned_facts: Dictionary = {
	speaking_to = "peacock",
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
		rosh_was_in_the_kitchen_all_night = {
			known = false,
			content = "Roch was in the kitchen all night"
		},
		ford_knows_nothing = {
			known = false,
			content = "Ford has no idea what is going on"
		},
	},
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	my_node = $"."
	player = $"../../../Player"
	my_node.visible = player.journal

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(_event):
	if Input.is_action_just_pressed("journal"):
		# Hand animation would go here if we had/wanted one for journal.
		# RN just makes hands invisible.
		var player_hands = $"../../../Player/AnimationHandling/Hands"
		player_hands.set_visible(!player_hands.is_visible())
		manager = $".."
		state_d = manager.dialogue_state
		
		
		for fact_id in state_d.facts:
			var fact = state_d.facts[fact_id]
			var _fact_known = pinned_facts.facts[fact_id]
			
			print_debug(pinned_facts.facts[fact_id])
			if pinned_facts.facts[fact_id] != fact:
				if fact.known == true:
					pinned_facts.facts[fact_id].known = true
					pinned_facts.facts[fact_id].content = state_d.facts[fact_id].content
					spawn_note(state_d.facts[fact_id].content)
					
					print_debug(pinned_facts.facts[fact_id].content)
					
				#print_debug(fact_known)
				
			
			#if fact.known:
			
