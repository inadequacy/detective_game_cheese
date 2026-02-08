extends CanvasLayer

func _on_retry_pressed():
	print("retry pressed")
	disable_buttons()
	$"..".game_lost()
	$CorrectAndWin.visible = false

func _on_reveal_pressed():
	print("done pressed")
	disable_buttons()
	$"Win Buttons/Letter".visible = true
	# show the winner text pls // fade in, scroll up which ever?

func disable_buttons():
	$"Win Buttons".visible = false
