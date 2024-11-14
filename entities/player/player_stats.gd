extends Node

@export var health:int = 100
@export var mana:int = 100

@onready var block = 0

func take_damage(damage: int) -> void:
	health = health - damage 
	
