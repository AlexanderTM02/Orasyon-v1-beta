extends BoardState

@export var player_turn_state: BoardState

var num_of_cards_drawn = 2
var move_to_next_state: bool = false

@onready var new_card = preload("res://entities/card/card.tscn")
@onready var player_hand = get_node("../../UI/PlayerHand")

func enter() -> void:
	for card_num in num_of_cards_drawn:
		add_card()
	move_to_next_state = true
	print("cards drawn")

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
