extends CharacterBody3D

var manager
@export var route_one : Array[Node3D]
@export var route_two : Array[Node3D]
@export var leave_time = 6

var is_seen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manager = $"../../Manager"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Path and when to go there go in here, need some kind of format for them
	#var target_position = route_one[0].global_transform.origin
	#position = position.move_toward(target_position, delta * 2)
	
	#move_and_slide()
#	if manager.time == 5:
#		pass
