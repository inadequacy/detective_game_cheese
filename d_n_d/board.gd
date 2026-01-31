extends Node2D

@export var move_speed: float = 600.0
@export var zoom_speed: float = 0.06
@export var min_zoom: float = 0.5
@export var max_zoom: float = 2.0
var player

var active := false

func _process(delta: float) -> void:
	
	active = $"../../../../Player".journal
	if not active:
		return

	var dir := Vector2.ZERO
	if Input.is_action_pressed("move_backward"): dir.y -= 1
	if Input.is_action_pressed("move_forward"): dir.y += 1
	if Input.is_action_pressed("rotate_right"): dir.x -= 1
	if Input.is_action_pressed("rotate_left"): dir.x += 1

	if dir != Vector2.ZERO:
		position += dir.normalized() * move_speed * delta

	var z := scale.x
	if Input.is_action_pressed("zoom_in"):
		z -= zoom_speed
	if Input.is_action_pressed("zoom_out"):
		z += zoom_speed

	z = clamp(z, min_zoom, max_zoom)
	scale = Vector2(z, z)
