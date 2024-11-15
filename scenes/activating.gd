extends BoardState

@export var player_turn: BoardState

var next_state: bool = false

@onready var card_placement = get_node("../../UI/PlacementArea/CardPlacement")
@onready var player = $"../../Entities/Player"
@onready var enemy = $"../../Entities/enemy"


func enter() -> void:
	print("in activating")
	
	activate_card_on_board()
	next_state = true


func exit() -> void:
	clear_child_nodes(card_placement)
	
	print("player health: " + str(player.current_health))
	print("player mana: " + str(player.current_mana))
	print("enemy health: " + str(enemy.current_health))
	print("enemy mana: " + str(enemy.current_mana))

func process_frame(delta: float) -> BoardState:
	if next_state:
		return player_turn
	return null

func activate_card_on_board() -> void:
	for card_to_activate in range(0, card_placement.get_child_count()):
		var card_playing = card_placement.get_child(card_to_activate)
		
		var spell_name = card_playing.spell_name
		var mana_cost = card_playing.mana_cost
		var attack_value = card_playing.attack_value
		var defense_value = card_playing.defense_value
		var cast_time = card_playing.cast_time
		
		match spell_name:
			"Fireball":
				enemy.take_damage(attack_value)
				player.use_mana(mana_cost)
			"Shield":
				player.add_shield(defense_value)
				player.use_mana(mana_cost)
			_:
				print("did not match")

func clear_child_nodes(node):
	for child in node.get_children():
		node.remove_child(child)
		child.queue_free()
