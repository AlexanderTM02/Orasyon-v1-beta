extends BoardState

@export var enemy_turn: BoardState
@export var activation_state: BoardState

var button_pressed: bool = false

@onready var end_turn = $"../../UI/EndTurn"
@onready var player = $"../../Entities/PlayerCharacter"
@onready var card_placement: Container = $"../../UI/PlacementArea/CardPlacement"
@onready var audio_stream_player_sfx: AudioStreamPlayer = $"../../AudioStreamPlayerSFX"

const ERROR = preload("res://assets/audio/sfx/Error.wav")

func enter() -> void:
	end_turn.show()

func exit() -> void:
	end_turn.hide()

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if button_pressed == true:
		button_pressed = false
		return activation_state
	return null

func _on_texture_button_pressed() -> void:
	if check_mana():
		button_pressed = true
	else:
		audio_stream_player_sfx.stream = ERROR
		audio_stream_player_sfx.play()
		print("not enough mana")

func check_mana() -> bool:
	var player_mana = player.current_mana
	var total_turn_mana = 0
	
	for card_to_activate in range(0, card_placement.get_child_count()):
		var card_playing = card_placement.get_child(card_to_activate)
		var mana_cost = card_playing.mana_cost
		
		total_turn_mana = total_turn_mana + mana_cost
	
	if player_mana < total_turn_mana:
		return false
		
	return true
