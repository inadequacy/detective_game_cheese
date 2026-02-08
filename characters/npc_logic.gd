extends CharacterBody3D

@export var route_one : Array[Node3D]
@export var route_two : Array[Node3D]
@export var route_three : Array[Node3D]
@export var route_four : Array[Node3D]
@export var event_times : Array[int]
var just_fired = false
var count = 0
var start_loc
var manager
var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_loc = position
	manager = $"../../Manager"
	timer = $Timer
	timer.start()

@export var speed := 7.0

var current_route : Array[Node3D]
var route_index := 0
var moving := false

func _physics_process(delta):
	var time_passed = 120 - timer.time_left
	
	if timer.time_left == timer.wait_time:
		count = 0
	if not route_one.is_empty():
		if time_passed >= event_times[0] and !moving and count == 0:
			move_to_node(route_one)
	if not route_two.is_empty():
		if time_passed >= event_times[1] and !moving and count == 1:
			if name == "Big Cheese":
				open_door()
			move_to_node(route_two)
	if not route_three.is_empty():
		if time_passed >= event_times[2] and !moving and count == 2:
			move_to_node(route_three)
	if not route_four.is_empty():
		if time_passed >= event_times[3] and !moving and count == 3:
			move_to_node(route_four)
	if moving:
		_move_along_route(delta)
	move_and_slide()

func open_door():
	$"../../Mansion/Door/Pivot/Door".interact()
	$"../../Mansion/Door/Pivot/Door".reversible = true

func move_to_node(routes : Array[Node3D]):
	current_route = routes
	route_index = 0
	moving = true

func _move_along_route(delta):
	if route_index >= current_route.size():
		moving = false
		velocity = Vector3.ZERO
		count += 1
		return
	var target = current_route[route_index].global_position
	var direction = target - global_position
	direction.y = 0
	if direction.length() <= speed * delta:
		global_position = Vector3(
			target.x,
			global_position.y,
			target.z
		)
		route_index += 1
		velocity = Vector3.ZERO
		return
	velocity.x = direction.normalized().x * speed
	velocity.z = direction.normalized().z * speed
	velocity.y = 0

func reset_all():
	moving = false
	count = 0
	velocity = Vector3.ZERO
	route_index = 0
	current_route = []

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#var time_passed = 120 - timer.time_left
	#if not route_one.is_empty():
		#if time_passed >= event_times[0] && just_fired == false && count == 0:
			#just_fired = true
			#move_to_node(delta, route_one)
	#if not route_two.is_empty():
		#if (time_passed >= event_times[1]) && (just_fired == false) && count == 1:
			#just_fired = true
			#move_to_node(delta, route_two)
	#
	## Path and when to go there go in here, need some kind of format for them
	##print(120 - timer.time_left)
	#
	#move_and_slide()
#
#func move_to_node(delta, routes):
	#var target_position
	#
	#for route in routes:
		#print(delta * 7)
		#target_position = route.global_transform.origin
		#print(position.move_toward(target_position, delta + 7))
		#velocity = position.move_toward(target_position, delta + 7)
		#await get_tree().create_timer(7).timeout
	#just_fired = false
	#count += 1
