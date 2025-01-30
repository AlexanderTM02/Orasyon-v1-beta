extends Node2D

@export var max_health:int = 100
@export var max_mana:int = 100

var current_health = max_health
var min_health = 0

var starting_mana = 100
var current_mana = starting_mana
var min_mana = 0

@onready var block_damage = 0
@onready var animation = $AnimatedSprite2D
@onready var effect_animation = $PlayerEffectsAnimation
@onready var damage_number_origin = $DamageNumberOrigin

func _ready() -> void:
	animation.play("default")
	effect_animation.play("default")
	pass

func take_damage(amount, is_critical: bool = false):
	var remaining_damage = amount
	
	# First apply damage to block
	if block_damage > 0:
		if block_damage >= remaining_damage:
			block_damage -= remaining_damage
			block_damage = 0
			
			return  # All damage was blocked
		else:
			remaining_damage -= block_damage
			block_damage = 0
	
	# Apply remaining damage to health
	current_health = clampi(current_health - remaining_damage, min_health, max_health)
	
	animation.play("hurt")
	await animation.animation_finished
	
	DamageNumbers.display_number(amount, damage_number_origin.global_position, is_critical)

func heal(amount):
	current_health = clampi(current_health + amount, min_health, max_health)
	DamageNumbers.display_number(amount, damage_number_origin.global_position, false, true)

func add_shield(amount:int) -> void:
	block_damage += amount

func use_mana(amount: int) -> void:
	current_mana = clampi(current_mana - amount, min_mana, max_mana)

func add_mana(amount: int) -> void:
	current_mana = clampi(current_mana + amount, min_mana, max_mana)

func _on_player_effects_animation_animation_finished() -> void:
	effect_animation.play("default")

func _on_animated_sprite_2d_animation_finished() -> void:
	animation.play("default")
	pass # Replace with function body.
