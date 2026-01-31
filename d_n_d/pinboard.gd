extends Control

var player
var my_node
var journal_open := false
var manager
var state_d
var pinned_facts: Dictionary = {
	speaking_to = "peacock",
	facts = {
		fact_1 = {
			known = false,
			content = "This is a fact"
		},
		fact_2 = {
			known = false,
			content = "This is a fact"
		},
		fact_3 = {
			known = false,
			content = "This is a fact"
		}
	}
	}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	my_node = $"."

	player=$"../../../Player"
	
	my_node.visible=player.journal
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _input(event):
	if Input.is_action_just_pressed("journal"):
		
		manager =$".."
		state_d=manager.dialogue_state
		
		
		for fact_id in state_d.facts:
			var fact = state_d.facts[fact_id]
			var fact_known=pinned_facts.facts[fact_id]
			
			if pinned_facts.facts[fact_id] == fact:
				print_debug(fact_known)
				
			
			#if fact.known:
			
