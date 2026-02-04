extends Node

@export var inactive_texture: Texture2D
@export var active_texture: Texture2D
@export var reversible: bool
var active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Default starting texture before it's had interaction
	$".".texture = inactive_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if active:
		$".".texture = active_texture
	else:
		$".".texture = inactive_texture

func interact():
	print(active, " and ", reversible)
	if active and reversible:
		"should be changed"
		active = false
	elif not active:
		active = true
