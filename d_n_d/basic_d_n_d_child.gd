extends Node2D

var dragging := false
var offset := Vector2.ZERO
var saved_size
@export var max_font_size=28
@export var min_font_size=1


@onready var sensor: Area2D = $OverlapSensor
var saved_scale = scale

# Waiting a physics frame supresses the errors, might not fix ???
func _ready() -> void:
	await get_tree().physics_frame
	
	
	
func fit_text():
	if get_child(2) == $TexLabel:
		var font = get_child(2).get_theme_font("font")
		var font_size = max_font_size

		while font_size >= min_font_size:
			print_debug(font_size)
			get_child(2).add_theme_font_size_override("font_size", font_size)

			await get_tree().process_frame  # ensure size updates

			if get_child(2).get_visible_line_count() >= get_child(2).get_line_count():
				break

			font_size -= 1
		#$TexLabel.add_theme_font_size_override("font",font_size)
		

func attach_to_book()->void:
	
	var book := get_tree().get_first_node_in_group("book")
	book.add_child(self)
	saved_size=scale
	fit_text()
	
	
	
	

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
	#overlaps.sort_custom(func(a,b):return a.z_index <b.z_index)
	

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
	#get_parent().remove_child(self)

	if best_base != null and best_base.is_in_group("book") == false:
		#best_base.add_child(self)
		reparent(best_base)
		global_scale = saved_size*board.scale
		z_index=best_base.get_z_index()
	elif best_base != null and best_base.is_in_group("book"):
		#get_parent().remove_child(self)
		#attach_to_book()
		reparent(best_base)
		global_scale=saved_size
		#z_index=best_base.get_z_index()+1
		
	# Can suppress error here by having elif clause
	else:
		
		#board.add_child(self)
		reparent(board)
		global_scale =saved_size*board.scale
		z_index=0
		

	global_position = saved_global
