extends BoardState

@export var player_turn: BoardState

var next_state: bool = false

@onready var card_placement = get_node("../../UI/PlacementArea/CardPlacement")
@onready var player = $"../../Player"
@onready var enemy = $"../../enemy"


func enter() -> void:
	print("in activating")
	
	activate_card_on_board()
	next_state = true


func exit() -> void:
	pass

func process_frame(delta: float) -> BoardState:
	if next_state:
		return player_turn
	return null

func activate_card_on_board() -> void:
	for card_to_activate in range(0, card_placement.get_child_count()):
		var card_playing = card_placement.get_child(card_to_activate)
		
		match card_playing.spell_name:
			"Fireball":
				print("ireball")
			"Shield":
				print("shield")
			_:
				print("did not match")
