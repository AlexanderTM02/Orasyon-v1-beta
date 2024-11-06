extends Resource
class_name CardDictionary

const FireballStats = preload("res://card_resources/fireball_stats.tres")
const ShieldStats = preload("res://card_resources/shield_stats.tres")

var cards = {
	"fireball": {
		"name": "Fireball",
		"spell_type": "offensive",
		"elemental_type": "fire",
		"description": "Launches a powerful ball of fire that deals area damage to enemies",
		"stats": FireballStats,
		"effect_class": FireballEffect
	},
	"shield": {
		"name": "Shield",
		"spell_type": "defensive",
		"elemental_type": "earth",
		"description": "Creates a protective barrier that absorbs incoming damage",
		"stats": ShieldStats,
		"effect_class": ShieldEffect
	}
}

# Function to execute a card's effect
func execute_card_effect(card_name: String, caster, target) -> void:
	if cards.has(card_name):
		var card_data = cards[card_name]
		var effect = card_data.effect_class.new(card_data.stats)
		effect.execute(caster, target)
