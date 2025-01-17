extends BoardState

@export var player_turn: BoardState
@export var win_loss_check_state: BoardState

var next_state: bool = false

@onready var card_placement = get_node("../../UI/PlacementArea/CardPlacement")
@onready var player = $"../../Entities/PlayerCharacter"
@onready var enemy = $"../../Entities/EnemyCharacter"
const WaitAnimation = preload("res://scenes/base_arena/arena_states/wait_animation.gd")


func enter() -> void:
	print("in activating")
	
	activate_card_on_board()
	next_state = true


func exit() -> void:
	clear_child_nodes(card_placement)

func process_frame(delta: float) -> BoardState:
	if next_state:
		return win_loss_check_state
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
		
		card_playing.animation_player.play("activating")
		

func clear_child_nodes(node):
	for child in node.get_children():
		node.remove_child(child)
		child.queue_free()
