extends Resource
class_name CardDictionary

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
		"card_art": null
	},
	
	"DAMAGE_BAKUNAWA": {
		"ID": "DAMAGE_BAKUNAWA",
		"name": "Bakunawa's Bite",
		"spell_type": "Damage",
		"description": "Deal 7 damage. After this card resolves, end your sequence.",
		"stats": {
			"damage": 7,
			"shield": 0,
			"heal": 0,
			"mana_cost": 3
		},
		"card_art": null
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
		"card_art": null
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
		"card_art": null
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
		"card_art": null
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
		"card_art": null
	},
	
	"HEAL_MAKILING": {
		"ID": "HEAL_MAKILING",
		"name": "Makiling's Touch",
		"spell_type": "Heal",
		"description": "Heal 6 health. After this card resolves, end your sequence.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 6,
			"mana_cost": 3
		},
		"card_art": null
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
		"card_art": null
	},
	
	"COPY_SARIMANOK": {
		"ID": "COPY_SARIMANOK",
		"name": "Sarimanok's Echo",
		"spell_type": "Copy",
		"description": "Copy the last damage card played this sequence. If none was played, deal 2 damage.",
		"stats": {
			"damage": 2,
			"shield": 0,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": null
	},
	
	"COMBO_LAKAN": {
		"ID": "COMBO_LAKAN",
		"name": "Lakan's Blessing",
		"spell_type": "Combo",
		"description": "Deal 3 damage and gain 2 shield. If played after a shield card, gain 4 shield instead.",
		"stats": {
			"damage": 3,
			"shield": 2,
			"heal": 0,
			"mana_cost": 3
		},
		"card_art": null
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
		"card_art": null
	},
	
	"MULTI_SAMBAL": {
		"ID": "MULTI_SAMBAL",
		"name": "Sambals' Dance",
		"spell_type": "Multi",
		"description": "Play a copy of each damage card played this sequence, in order.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 0,
			"mana_cost": 4
		},
		"card_art": null
	},
	
	"SIMPLE_AGTA": {
		"ID": "SIMPLE_AGTA",
		"name": "Agta's Strength",
		"spell_type": "Simple",
		"description": "Deal 2 damage and gain 2 shield.",
		"stats": {
			"damage": 2,
			"shield": 2,
			"heal": 0,
			"mana_cost": 2
		},
		"card_art": null
	},
	
	"SIMPLE_DIWATA": {
		"ID": "SIMPLE_DIWATA",
		"name": "Diwata's Care",
		"spell_type": "Simple",
		"description": "Heal 2 health and draw 1 card.",
		"stats": {
			"damage": 0,
			"shield": 0,
			"heal": 2,
			"mana_cost": 2
		},
		"card_art": null
	},
}

# Method to get a random card from the dictionary
func get_random_card() -> Dictionary:
	# Get a list of the card keys
	var card_keys = cards.keys()
	# Choose a random key
	var random_key = card_keys[randi() % card_keys.size()]
	# Return the card data
	return cards[random_key]
