class_name PlayerStats
extends Node

@export var max_health:int = 100
@export var mana:int = 100

var current_health = 100
var min_health = 0

@onready var block = 0


func take_damage(amount):
	current_health = clampi(current_health - amount, min_health, max_health)

func heal(amount):
	current_health = clampi(current_health + amount, min_health, max_health)

func add_block(amount:int) -> void:
	pass
