extends Resource

var cards = {
	"DAMAGE_BERNARDO": {
		"ID": "DAMAGE_BERNARDO",
		"name": "Bernardo Carpio's Punch",
		"spell_type": "Damage",
		"description": "Deal 4 damage.",
		"stats": {
			"damage": 4,
			"shield": 0,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/bernardo_punch.png")
	},
	
	"DAMAGE_BAKUNAWA": {
		"ID": "DAMAGE_BAKUNAWA",
		"name": "Bakunawa's Bite",
		"spell_type": "Damage",
		"description": "Deal 7 damage.",
		"stats": {
			"damage": 7,
			"shield": 0,
			"heal": 0,
			"mana_cost": 3
		},
		"card_art": load("res://assets/card/card_art/bakunawa_strike.png")
	},

	"DAMAGE_MINOKAWA": {
		"ID": "DAMAGE_MINOKAWA",
		"name": "Minokawa's Strike",
		"spell_type": "Damage",
		"description": "Deal 3 damage. If played after another damage card, deal 5 damage instead.",
		"stats": {
			"damage": 3,
			"shield": 0,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/minokawa_scratch.png")
	},
	
	"SHIELD_KAPRE": {
		"ID": "SHIELD_KAPRE",
		"name": "Kapre's Tobacco Shield",
		"spell_type": "Shield",
		"description": "Gain 4 shield.",
		"stats": {
			"damage": 0,
			"shield": 4,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/tabacco_mist.png")
	},
	
	"SHIELD_MARIANG_MAKILING": {
		"ID": "SHIELD_MARIANG_MAKILING",
		"name": "Mariang Makiling's Veil",
		"spell_type": "Shield",
		"description": "Gain 3 shield and draw 1 card. If this is the third card in your sequence, draw 2 cards instead.",
		"stats": {
			"damage": 0,
			"shield": 3,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/mariamakiling_veil.png")
	},
	
	"HEAL_BABAYLAN": {
		"ID": "HEAL_BABAYLAN",
		"name": "Babaylan's Prayer",
		"spell_type": "Heal",
		"description": "Heal 3 health.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 3,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/bathala_prayer.png")
	},
	
	"HEAL_MAKILING": {
		"ID": "HEAL_MAKILING",
		"name": "Makiling's Touch",
		"spell_type": "Heal",
		"description": "Heal 6 health.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 6,
			"mana_cost": 3
		},
		"card_art": load("res://assets/card/card_art/makiling_touch.png")
	},

	"COPY_IBONG_ADARNA": {
		"ID": "COPY_IBONG_ADARNA",
		"name": "Adarna's Song",
		"spell_type": "Copy",
		"description": "Copy the effect of the previous card in the sequence. Costs 1 less mana than the copied card.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 0,
			"mana_cost": 0
		},
		"card_art": load("res://assets/card/card_art/adarna_song.png")
	},
	
	"COMBO_KAPRE_BREATHE": {
		"ID": "COMBO_KAPRE_BREATH",
		"name": "Kapre's Breath",
		"spell_type": "Damage",
		"description": "Deal 3 damage and gain 2 shield. If played after a shield card, gain 4 shield instead.",
		"stats": {
			"damage": 3,
			"shield": 2,
			"heal": 0,
			"mana_cost": 3
		},
		"card_art": load("res://assets/card/card_art/smoker_breathe.png")
	},
	
	"UTILITY_BATHALA": {
		"ID": "UTILITY_BATHALA",
		"name": "Bathala's Gift",
		"spell_type": "Utility",
		"description": "The next card in your sequence costs 0 mana. Draw 1 card.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 0,
			"mana_cost": 1
		},
		"card_art": load("res://assets/card/card_art/bathala_gift.png")
	},
	
	"SIMPLE_AGTA": {
		"ID": "SIMPLE_AGTA",
		"name": "Sambal's Strength",
		"spell_type": "Damage",
		"description": "Deal 2 damage and gain 2 shield.",
		"stats": {
			"damage": 2,
			"shield": 2,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/sambal_dance.png")
	},
	
	"SIMPLE_DIWATA": {
		"ID": "SIMPLE_DIWATA",
		"name": "Diwata's Care",
		"spell_type": "Heal",
		"description": "Heal 2 health and draw 1 card.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 2,
			"mana_cost": 2
		},
		"card_art": load("res://assets/card/card_art/magic.png") ### to be changed
	},
	
	"DUMB_DRAGON": {
		"ID": "DUMB_DRAGON",
		"name": "Dumb Dragon's help",
		"spell_type": "Damage",
		"description": "gain 4 shield damage and deal 2 damage. If played after a damage card, deal X2 damage instead.",
		"stats": {
			"damage": 2,
			"shield": 3,
			"heal": 0,
			"mana_cost": 5
		},
		"card_art": load("res://assets/card/card_art/dumb_dragon.png") ### to be changed
	}
	
}

func get_dictionary() -> Dictionary:
	return cards

# Method to get a random card from the dictionary
func get_random_card() -> Dictionary:
	# Get a list of the card keys
	var card_keys = cards.keys()
	# Choose a random key
	var random_key = card_keys[randi() % card_keys.size()]
	# Return the card data
	return cards[random_key]
