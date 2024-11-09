extends Resource
class_name BaseCardEffect

var stats: CardStats

func _init(card_stats: CardStats):
	stats = card_stats

func execute(caster, target):
	pass
