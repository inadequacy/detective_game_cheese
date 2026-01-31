extends Node

@export var inactive_texture: Texture2D
@export var active_texture: Texture2D
@export var reversible: bool
var active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Default starting texture before it's had interaction
	$Sprite3D.texture = inactive_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		$Sprite3D.texture = active_texture
	else:
		$Sprite3D.texture = inactive_texture

func interact() -> void:
	if active and reversible:
		active = false
	if not active:
		active = true
