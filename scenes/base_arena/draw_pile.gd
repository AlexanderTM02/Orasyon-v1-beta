extends Node

@export var card_scene: PackedScene  # Scene to instance the card (make sure you have a Card scene with your card visuals)
@onready var card_dictionary_resource = preload("res://entities/card/card_resources/card_dictionary.gd").new()
@onready var player_hand: Hand = $"../PlayerHand"

var draw_pile: Array = []

func _ready() -> void:
	# Initialize the draw pile with two copies of each card
	initialize_draw_pile()
	# Shuffle the pile to randomize the order
	shuffle_draw_pile()

func initialize_draw_pile() -> void:
	# Get card data from the dictionary
	var cards = card_dictionary_resource.get_dictionary()
	
	# Add two copies of each card to the draw pile
	for card_key in cards.keys():
		for i in range(2):  # Adding two copies of each card
			draw_pile.append(cards[card_key])

func shuffle_draw_pile() -> void:
	# Shuffle the draw pile to randomize the order of cards
	draw_pile.shuffle()

func draw_card() -> Dictionary:
	# Draw a card from the pile if there are cards left
	if draw_pile.size() > 0:
		var drawn_card = draw_pile.pop_back()
		_instance_card(drawn_card)  # Create and instance the card visually
		return drawn_card
	else:
		print("No more cards left in the draw pile!")
		return {}

func _instance_card(card_data: Dictionary) -> void:
	# Instance a new card and set its properties
	var card_instance = card_scene.instantiate()
	var card_script = card_instance as Card
	
	# Set the card properties
	card_script.card_id = card_data["ID"]
	card_script.spell_name = card_data["name"]
	card_script.mana_cost = card_data["stats"]["mana_cost"]
	card_script.spell_type = card_data["spell_type"]
	card_script.attack_value = card_data["stats"]["damage"]
	card_script.defense_value = card_data["stats"]["shield"]
	card_script.heal_value = card_data["stats"]["heal"]
	card_script.spell_description = card_data["description"]
	
	# Add the card to the scene (you might want to add it to a specific parent)
	player_hand.add_child(card_instance)
	
	card_script.update_card_info()  # Update the card's display with these values
