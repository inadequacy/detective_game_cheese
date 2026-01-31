extends Control


var player
var my_node
var journal_open := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	my_node = $"."

	player=$"../../../Player"
	
	my_node.visible=player.journal
	
@onready var journal_root = self # your instanced 2D scene root
@onready var journal_content = $Board



func _unhandled_input(event):
	if event.is_action_pressed("journal"):
		journal_open = !journal_open
		journal_root.visible = journal_open
		journal_content.active = journal_open

		# stop player movement while journal open
		set_physics_process(!journal_open)
	 
	
