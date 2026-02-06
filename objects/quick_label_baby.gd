@tool
extends Node3D

func _ready():
	if Engine.is_editor_hint():
		$Label3D.text = str(get_parent().name , " ", name)
