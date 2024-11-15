class_name Enemy
extends Node

@export var max_health:int = 100
@export var mana:int = 100

var current_health = 100
var min_health = 0

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
	
