extends BoardState

@export var player_turn: BoardState
@export var win_loss_check_state: BoardState
@export var enemy_turn: BoardState

var next_state: bool = false
var end_sequence: bool = false

@onready var card_placement = $"../../UI/PlacementArea/CardPlacement"
@onready var player_hand = $"../../UI/PlayerHand"
@onready var player = $"../../Entities/PlayerCharacter"
@onready var enemy = $"../../Entities/EnemyCharacter"
const WaitAnimation = preload("res://scenes/base_arena/arena_states/wait_animation.gd")

@onready var audio_stream_player_sfx: AudioStreamPlayer = $"../../AudioStreamPlayerSFX"
const HIT_PUNCH_ = preload("res://assets/audio/sfx/hit(punch).wav")


func enter() -> void:
	disable_card_input()
	activate_card_on_board()

func exit() -> void:
	print("exit activation state")
	clear_child_nodes(card_placement)
	enable_card_input()
	next_state = false

func process_frame(delta: float) -> BoardState:
	if next_state:
		return enemy_turn
	return null

func activate_card_on_board() -> void:
	for current_card_index in range(card_placement.get_child_count()):
		print("card index actvating: " + str(current_card_index))
		
		var card_playing = card_placement.get_child(current_card_index)
		
		var tween = get_tree().create_tween()
		tween.tween_property(
			card_playing, "position:y", card_playing.global_position.y + 50, 0.25
		).set_ease(Tween.EASE_OUT)
		
		process_card_effects(card_playing, current_card_index)
		
		tween.tween_property(
			card_playing, "position:y", card_playing.global_position.y - 30, 0.25
		).set_ease(Tween.EASE_IN)
		
		await tween.finished
		
		if end_sequence:
			Utilities.wait_seconds(1)
			break
		
	next_state = true

func process_card_effects(card, current_card_index):
	
	player.attack_animation()
	
	match card.card_id:
		"DAMAGE_BERNARDO":
			enemy.take_damage(card.attack_value)
			
		"DAMAGE_BAKUNAWA":
			enemy.take_damage(card.attack_value)
			end_sequence = true
			
		"DAMAGE_MINOKAWA":
			var previous_card_index = max(current_card_index - 1, 0)
			var previous_card = card_placement.get_child(previous_card_index)
			
			if current_card_index == previous_card_index:
				if previous_card.spell_type == "Damage":
					enemy.take_damage(5, true)
				else:
					enemy.take_damage(card.attack_value)
			else:
				enemy.take_damage(card.attack_value)
			
		"SHIELD_KAPRE":
			player.add_shield(card.defense_value)
			
		"SHIELD_MARIANG_MAKILING":
			player.add_shield(card.defense_value)
			player_hand.draw()
			
			if current_card_index == 2:
				player_hand.draw()
			
		"HEAL_BABAYLAN":
			player.heal(card.heal_value)
			
		"HEAL_MAKILING":
			player.heal(card.heal_value)
			end_sequence = true
			
		"COPY_IBONG_ADARNA":
			var previous_card_index = max(current_card_index - 1, 0)
			var previous_card = card_placement.get_child(previous_card_index)
			
			previous_card.mana_cost -= 1
			
			if previous_card_index == 0 and previous_card.card_id == "COPY_IBONG_ADARNA":
				pass
			else:
				var tween = get_tree().create_tween()
				tween.tween_property(
					card, "position:y", card.global_position.y + 50, 0.25
				).set_ease(Tween.EASE_OUT)
				
				#make animation of turning into previous card
				process_card_effects(previous_card, previous_card_index)
				
				tween.tween_property(
					card, "position:y", card.global_position.y - 30, 0.25
				).set_ease(Tween.EASE_IN).set_delay(0.50)
				
				await tween.finished
			
		"COPY_SARIMANOK":
			var previous_card_index = max(current_card_index - 1, 0)
			var previous_card = card_placement.get_child(previous_card_index)
			
			var last_damage_card = null
			
			for i in range(current_card_index - 1, -1, -1): #loop backwards
				var looped_card = card_placement.get_child(i) 
				if looped_card.spell_type =="Damage" and looped_card.card_id == "COPY_SARIMANOK":
					last_damage_card = card
					if last_damage_card != null:
						
						var tween = get_tree().create_tween()
						tween.tween_property(
							card, "position:y", card.global_position.y + 50, 0.25
						).set_ease(Tween.EASE_OUT)
						
						process_card_effects(last_damage_card, i)
						
						tween.tween_property(
							card, "position:y", card.global_position.y - 30, 0.25
						).set_ease(Tween.EASE_IN).set_delay(0.50)
						
						
					else:
						enemy.take_damage(2)
					break
			
		"COMBO_KAPRE_BREATH":
			var previous_card_index = max(current_card_index - 1, 0)
			var previous_card = card_placement.get_child(previous_card_index)
			
			enemy.take_damage(card.attack_value)
			player.add_shield(card.defense_value)
			
			if previous_card.spell_type == "Shield":
				player.add_shield(2)
			
		"UTILITY_BATHALA":
			if current_card_index + 1 < card_placement.get_child_count():
				var next_card_index = current_card_index + 1
				var next_card = card_placement.get_child(next_card_index)
				
				# Set the next card's mana cost to 0
				next_card.mana_cost = 0
			else:
				# Handle the case where there is no next card
				print("No next card to modify.")
				
			# Draw a card for the player
			player_hand.draw()
			
		"MULTI_SAMBAL":
			# Loop through all the cards played in the current sequence
			for i in range(current_card_index):
				var looped_card = card_placement.get_child(i)
			
			# Check if the card is a damage card
				if looped_card.spell_type == "Damage":
					
					var tween = get_tree().create_tween()
					tween.tween_property(
						looped_card, "position:y", looped_card.global_position.y + 50, 0.25
					).set_ease(Tween.EASE_OUT)
				# Replay the damage card's effect
					process_card_effects(looped_card, i)
					
					tween.tween_property(
						card, "position:y", card.global_position.y - 30, 0.25
					).set_ease(Tween.EASE_IN).set_delay(0.50)
						
			
		"SIMPLE_AGTA":
			player.add_shield(card.defense_value)
			enemy.take_damage(card.attack_value)
			pass #put card effects here
			
		"SIMPLE_DIWATA":
			player.heal(card.heal_value)
			pass #put card effects here
			
		_:
			print(str(card.card_id))
			print("did not match")
			
	player.use_mana(card.mana_cost)
	audio_stream_player_sfx.stream = HIT_PUNCH_
	audio_stream_player_sfx.play()
	
	print("card " + str(current_card_index) + " activated")
	

func check_all_cards_processed():
	next_state = true

func clear_child_nodes(node):
	for child in node.get_children():
		child.queue_free()

func disable_card_input():
	for card in card_placement.get_children():
		card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for card in player_hand.get_children():
		card.mouse_filter = Control.MOUSE_FILTER_IGNORE

func enable_card_input():
	for card in player_hand.get_children():
		card.mouse_filter = Control.MOUSE_FILTER_PASS

#func disable_card_input():
	#for card_to_activate in range(card_placement.get_child_count()):
		#var card_playing = card_placement.get_child(card_to_activate)
		#
		#card_playing.mouse_filter = Control.MOUSE_FILTER_IGNORE
		#
	#for cards in range(player_hand.get_child_count()):
		#var card = player_hand.get_child(cards)
		#card.mouse_filter = Control.MOUSE_FILTER_IGNORE
#
#func enable_card_input():
	#for cards in range(player_hand.get_child_count()):
		#var card = player_hand.get_child(cards)
		#card.mouse_filter = Control.MOUSE_FILTER_PASS
