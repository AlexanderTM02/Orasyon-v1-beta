extends Resource
class_name CardDictionary

var card_stats_resource = preload("res://entities/card/card_resources/card_stats.gd").new()

var cards = {
	"fireball": {
		"name": "Fireball",
		"spell_type": "offensive",
		"elemental_type": "fire",
		"description": "Launches a powerful ball of fire that deals area damage to enemies",
		"stats": card_stats_resource.card_stats["fireball"] ,
		"effect_class": FireballEffect,
		"card_art": preload("res://assets/card/card_art/flare1.png")
	},
	"shield": {
		"name": "Shield",
		"spell_type": "defensive",
		"elemental_type": "earth",
		"description": "Creates a protective barrier that absorbs incoming damage",
		"stats": card_stats_resource.card_stats["shield"],
		"effect_class": ShieldEffect,
		"card_art": preload("res://assets/card/card_art/flare.png")
	}
}

# Method to get a random card from the dictionary
func get_random_card() -> Dictionary:
	# Get a list of the card keys
	var card_keys = cards.keys()
	# Choose a random key
	var random_key = card_keys[randi() % card_keys.size()]
	# Return the card data
	return cards[random_key]
