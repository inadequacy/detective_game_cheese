extends CanvasLayer

func _on_retry_pressed():
	print("retry pressed")
	disable_buttons()
	$"..".game_lost()
	$CorrectAndWin.visible = false

func _on_reveal_pressed():
	print("done pressed")
	$"Win Buttons/retry".visible = false
	$"Win Buttons/reveal".visible = false
	$"Win Buttons/Letter".visible = true
	$AnimationPlayer.play("the_reveal")
	# show the winner text pls // fade in, scroll up which ever?

func disable_buttons():
	$"Win Buttons".visible = false

func _on_quit_pressed():
	get_tree().quit()
