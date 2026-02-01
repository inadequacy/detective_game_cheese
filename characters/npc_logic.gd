extends CharacterBody3D

@export var route_one : Array[Node3D]
@export var route_two : Array[Node3D]
@export var route_three : Array[Node3D]
@export var event_times : Array[int]
var start_loc
var manager
var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_loc = position
	print("npc start loc ", name, " ", start_loc)
	manager = $"../../Manager"
	timer = $Timer
	timer.start()

var just_fired = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_passed = 120 - timer.time_left
	if (time_passed >= event_times[0]) && (time_passed <= event_times[1]):
		just_fired = true
		move_to_node(delta, route_one)
	# Path and when to go there go in here, need some kind of format for them
	#print(120 - timer.time_left)
	
	move_and_slide()

func move_to_node(delta, routes):
	var target_position
	
	for route in routes:
		print("called")
		target_position = route.global_transform.origin
		position = position.move_toward(target_position, delta * 7)
		await get_tree().create_timer(7).timeout
	just_fired = false
