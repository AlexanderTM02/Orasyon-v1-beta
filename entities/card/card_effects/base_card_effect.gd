extends Node
class_name BaseCardEffect

var target_enemy
var card: Card

func set_card_target(spell_used: Card, target) -> void:
	target = target
	card = spell_used

func enter() -> void:
	pass

func exit() -> void:
	pass
