class_name Enemy
extends Node

@export var max_health:int = 60
@export var max_mana:int = 20

var current_health = max_health
var min_health = 0

var starting_mana = 4
var current_mana = starting_mana
var min_mana = 0

@onready var block_damage = 0

func take_damage(amount):
	var remaining_damage = amount
	
	# First apply damage to block
	if block_damage > 0:
		if block_damage >= remaining_damage:
			block_damage -= remaining_damage
			return  # All damage was blocked
		else:
			remaining_damage -= block_damage
			block_damage = 0
	
	# Apply remaining damage to health
	current_health = clampi(current_health - remaining_damage, min_health, max_health)

func heal(amount):
	current_health = clampi(current_health + amount, min_health, max_health)

func add_shield(amount:int) -> void:
	block_damage += amount

func use_mana(amount: int) -> void:
	current_mana = clampi(current_mana - amount, min_mana, max_mana)

func add_mana(amount: int) -> void:
	current_mana = clampi(current_mana + amount, min_mana, max_mana)
	
