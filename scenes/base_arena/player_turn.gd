extends BoardState

@export var enemy_turn: BoardState

var button_pressed: bool = false

@onready var end_turn = $"../../UI/EndTurn"
@onready var player: Enemy = $"../../Entities/Player"
@onready var card_placement: HBoxContainer = $"../../UI/PlacementArea/CardPlacement"


func enter() -> void:
	end_turn.show()
	print("in playerturn")

func exit() -> void:
	end_turn.hide()

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if button_pressed == true:
		button_pressed = false
		return enemy_turn
	return null

func _on_texture_button_pressed() -> void:
	if check_mana():
		button_pressed = true
	else:
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