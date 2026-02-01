extends Area3D

@onready var interaction_label = $"../InteractionPrompt/CenterContainer/Label"
@onready var dialogue_ui = $"../../Manager/DialogueUI"
@onready var audio_stream_player = $"./AudioStreamPlayer"
var can_interact = false
var interacting_with = ""
var talk = preload("res://sound_effects/talk2.mp3")

func play_talking():
	audio_stream_player.stream = talk
	audio_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var contains_npc = false
	for body in get_overlapping_bodies():
		var groups = body.get_groups()
		if groups.has("npc"):
			# Display button to talk with this character
			contains_npc = true
			can_interact = true
			interacting_with = body.name
			interaction_label.text = "Press F to speak to " + interacting_with

	if not contains_npc:
		can_interact = false
		interaction_label.text = ""
		interacting_with = ""

func _input(event: InputEvent) -> void:
	if can_interact and Input.is_action_pressed("to_pay_respect") and not dialogue_ui.dialogue_state.is_speaking:
		talk_to(interacting_with)

func talk_to(who: String) -> void:
	play_talking()
	dialogue_ui.dialogue_state.speaking_to = who
	DialogueManager.show_dialogue_balloon(dialogue_ui.dialogue_resource, "start", [dialogue_ui.dialogue_state])
