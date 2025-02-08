extends Node

@onready var draw_pile: Node = get_parent().get_node("DrawPile")
var discarded_cards: Array = []

func add_to_discard(card: Node) -> void:
	
	var card_data = {
		"ID": card.card_id,
		"name": card.spell_name,
		"stats": {
			"mana_cost": card.mana_cost,
			"damage": card.attack_value,
			"shield": card.defense_value,
			"heal": card.heal_value
		},
		"spell_type": card.spell_type,
		"description": card.spell_description
	}
	discarded_cards.append(card_data)
	card.queue_free()  # Remove the card node from the scene
	check_and_refill_draw_pile()
	print("cards in discard: " + str(discarded_cards.size()))

func check_and_refill_draw_pile() -> void:
	if draw_pile.draw_pile.size() == 0 and discarded_cards.size() > 0:
		draw_pile.draw_pile = discarded_cards.duplicate()
		discarded_cards.clear()
		draw_pile.shuffle_draw_pile()
		print("Draw pile refilled from discard pile.")
