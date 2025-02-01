extends Node2D

const ENEMY_CHARACTER = preload("res://entities/enemies/enemy_character.tscn")
const PLAYER = preload("res://entities/player/player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var PlayerCharacter = PLAYER.instantiate()
	self.add_child(PlayerCharacter)
	
	var EnemyCharacter = ENEMY_CHARACTER.instantiate()
	self.add_child(EnemyCharacter)
