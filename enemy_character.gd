extends Node2D

@export var max_health:int = 25

var current_health = max_health
var min_health = 0

@onready var block_damage = 0
@onready var animation: AnimatedSprite2D
@onready var health_label = $HealthIcon/HealthLabel
@onready var damage_number_origin = $DamageNumberOrigin

func _ready() -> void:
	
	if Settings.current_level == 1:
		animation  = $DuwendeAnimations
		max_health = 10
	elif Settings.current_level == 2:
		animation = $MananangalAnimations
		max_health = 25
	elif Settings.current_level == 3:
		animation = $KapreAnimations
		max_health = 50
		
	current_health = max_health
	
	animation.show()
	
	animation.set_autoplay("default")
	animation.play("default")
	health_label.text = str(max_health)

func take_damage(amount, is_critical: bool = false):
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
	health_label.text = str(current_health)
	
	animation.play("hurt")
	
	DamageNumbers.display_number(amount, damage_number_origin.global_position, is_critical)

func heal(amount):
	current_health = clampi(current_health + amount, min_health, max_health)

func add_shield(amount:int) -> void:
	block_damage += amount

func enemy_attack(player):
	var random_damage = randi_range(5, 15)
	
	var original_pos = self.global_position
	
	animation.play("attack")
	
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position:x", self.global_position.x - 30, 0.3
	).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUINT)
	
	player.take_damage(random_damage)
	
	tween.tween_property(self, "position", original_pos, 0.1
	).set_ease(Tween.EASE_OUT).set_delay(0.7)
	
	await tween.finished


func _on_animated_sprite_2d_animation_finished() -> void:
	animation.play("default")


func _on_duwende_animations_animation_finished() -> void:
	animation.play("default")


func _on_kapre_animations_animation_finished() -> void:
	animation.play("default")
