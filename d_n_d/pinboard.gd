extends Control

var player
var my_node
var journal_open := false
var manager
var pinned_facts: Dictionary
var state_d


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
			
			if pinned_facts[fact_id] == fact:
				print_debug(fact_id, fact.known)
				
			
			#if fact.known:
			
