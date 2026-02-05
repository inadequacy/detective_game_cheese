extends Area3D

@onready var interaction_label = $"../InteractionPrompt/CenterContainer/Label"
@onready var dialogue_ui = $"../../Manager/DialogueUI"
@onready var audio_stream_player = $"./AudioStreamPlayer"
var can_interact = false
var interacting_with = ""
var talk2 = preload("res://sound_effects/talk2.mp3")
var talk3 = preload("res://sound_effects/talk3.mp3")
var talk4 = preload("res://sound_effects/talk4.mp3")

func play_talking():
	var talk = [talk2, talk3, talk4].pick_random()
	audio_stream_player.stream = talk
	audio_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
var contains_npc
var contains_object
func _process(_delta: float) -> void:
	contains_npc = false
	contains_object = false
	for body in get_overlapping_bodies():
		var groups = body.get_groups()
		if groups.has("npc"):
			# Display button to talk with this character
			contains_npc = true
			can_interact = true
			interacting_with = body.name
			interaction_label.text = "Press F to speak to " + interacting_with
		if groups.has("interactable"):
			contains_object = true
			can_interact = true
			interacting_with = body.name
			interaction_label.text = "Press F to interact with " + interacting_with

	if not contains_npc and not contains_object:
		can_interact = false
		interaction_label.text = ""
		interacting_with = ""

func _input(_event: InputEvent) -> void:
	if contains_npc and Input.is_action_pressed("to_pay_respect") and not dialogue_ui.dialogue_state.is_speaking:
		talk_to(interacting_with)

func talk_to(who: String) -> void:
	play_talking()
	dialogue_ui.dialogue_state.speaking_to = who
	DialogueManager.show_dialogue_balloon(dialogue_ui.dialogue_resource, "start", [dialogue_ui.dialogue_state])

func laugh_audio() -> void:
	pass
