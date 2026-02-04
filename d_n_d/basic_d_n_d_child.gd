extends Node2D

var dragging := false
var offset := Vector2.ZERO


@onready var sensor: Area2D = $OverlapSensor

# Waiting a physics frame supresses the errors, might not fix ???
func _ready() -> void:
	await get_tree().physics_frame
	
	_try_attach_or_drop()

func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	dragging = true
	z_index = 6
	offset = get_global_mouse_position() - global_position
	

func _on_button_button_up() -> void:
	dragging = false

	_try_attach_or_drop()

func _try_attach_or_drop() -> void:
	var board := get_tree().get_first_node_in_group("board")
	var _pinwand := get_tree().get_first_node_in_group("board")
	if board == null:
		push_error("No node in group 'board'.")
		return

	# Find a base under us
	var overlaps := sensor.get_overlapping_areas()
	var best_base: Node2D = null
	var best_dist := INF

	for a in overlaps:
		var base := a.get_parent() as Node2D
		
		if base != null and base.is_in_group("book"):
			best_base = base
			break
		elif base != null and base.is_in_group("base"):
				var d := global_position.distance_to(base.global_position)
				if d < best_dist:
					best_dist = d
					best_base = base
		
	# Reparent (keep global position) either to base or back to board
	var saved_global := global_position
	get_parent().remove_child(self)

	if best_base != null:
		best_base.add_child(self)
		z_index=best_base.get_z_index()+1
	# Can suppress error here by having elif clause
	else:
		
		board.add_child(self)

	global_position = saved_global
