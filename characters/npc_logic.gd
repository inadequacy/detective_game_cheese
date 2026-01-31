extends CharacterBody3D

var manager
@export var route_one = Node3D
@export var route_two = {}
@export var start_time = 6
var is_seen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	manager = $"../Manager"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target_position = route_one.global_transform.origin
	position = position.move_toward(target_position, delta * 2)
	
	move_and_collide(velocity)
	print(position)
#	if manager.time == 5:
#		pass
