extends BoardState

var CARD_DICTIONARY = preload("res://entities/card/card_resources/card_dictionary.gd")

@export var player_turn_state: BoardState

var num_of_cards_drawn = 2
var move_to_next_state: bool = false

var mana_per_turn = 4

@onready var player_hand: Container = $"../../UI/PlayerHand"
@onready var player = $"../../Entities/PlayerCharacter"
@onready var draw_pile: Node = $"../../UI/DrawPile"
@onready var board: Node = $"../.."

@onready var audio_stream_player_sfx: AudioStreamPlayer = $"../../AudioStreamPlayerSFX"

const CARD_DRAW_1 = preload("res://assets/audio/sfx/card draw1.wav")

func enter() -> void:
	board.current_round += 1
	
	if board.current_round == 1:
		for initial_draw in 5:
			draw_pile.draw_card()
	else:
		var player_mana = player.add_mana(mana_per_turn)
		for current_draw in num_of_cards_drawn:
			draw_pile.draw_card()
	
	move_to_next_state = true

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if move_to_next_state == true:
		return player_turn_state
	return null
