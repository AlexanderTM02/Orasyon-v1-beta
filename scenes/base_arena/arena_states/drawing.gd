extends BoardState

@export var player_turn_state: BoardState

var num_of_cards_drawn = 2
var move_to_next_state: bool = false

var mana_per_turn = 4

const new_card = preload("res://entities/card/card.tscn")

@onready var player_hand: Container = $"../../UI/PlayerHand"
@onready var player = $"../../Entities/PlayerCharacter"
@onready var audio_stream_player_sfx: AudioStreamPlayer = $"../../AudioStreamPlayerSFX"

const CARD_DRAW_1 = preload("res://assets/audio/sfx/card draw1.wav")

func enter() -> void:
	var player_mana = player.add_mana(mana_per_turn)
	
	for card_num in num_of_cards_drawn:
		audio_stream_player_sfx.stream = CARD_DRAW_1
		audio_stream_player_sfx.play()
		add_card()
	move_to_next_state = true

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if move_to_next_state == true:
		return player_turn_state
	return null

func add_card() -> void:
	var card_instance = new_card.instantiate()
	player_hand.add_child(card_instance)
	player_hand._update_cards()
