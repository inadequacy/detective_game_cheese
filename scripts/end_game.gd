extends CanvasLayer

func _on_retry_pressed() -> void:
	disable_buttons()
	$"..".game_lost()

func _on_done_pressed() -> void:
	disable_buttons()
	$"Win Buttons/Letter".visible = true
	# show the winner text pls // fade in, scroll up which ever?

func disable_buttons():
	$"Win Buttons".visible = false
