extends BoardState

@export var player_turn: BoardState

var next_state: bool = false

func enter() -> void:
	print("in activating")
	activate_card_on_board()
	next_state = true
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state:
		return player_turn
	return null

func activate_card_on_board() -> void:
	pass
