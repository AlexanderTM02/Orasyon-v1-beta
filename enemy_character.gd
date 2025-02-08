extends Node2D

@export var max_health:int = 25

var current_health = max_health
var min_health = 0

@onready var block_damage = 0
@onready var animation: AnimatedSprite2D
@onready var health_label = $HealthIcon/HealthLabel
@onready var damage_number_origin = $DamageNumberOrigin
@onready var health_bar: ProgressBar = $HealthBar

@onready var actions_info: Control = $Actions



@export var player: Node


var actions = ["attack", "heal", "shield"]
var current_action = "attack"
var next_action = "attack"
var next_amount
var current_amount

func _ready() -> void:
	
	match Settings.current_level:
		1:
			animation = $DuwendeAnimations
			max_health = 10
		2:
			animation = $MananangalAnimations
			max_health = 25
		3:
			animation = $KapreAnimations
			max_health = 50
	
	current_health = max_health
	health_label.text = str(max_health)
	
	health_bar.max_value = max_health
	health_bar.value = current_health
	
	animation.show()
	animation.set_autoplay("default")
	animation.play("default")
	
	init_current_action()

func init_current_action():
	current_action = actions[randi() % actions.size()]
	
	match current_action:
		"attack":
			current_amount = randi_range(5, 10)
		"heal":
			current_amount = randi_range(5, 10)
		"shield":
			current_amount = randi_range(3, 8)
		_:
			pass
	
	choose_next_action()

func choose_next_action():
	next_action = actions[randi() % actions.size()]  # Pick a random action
	
	match next_action:
		"attack":
			next_amount = randi_range(5, 10)
		"heal":
			next_amount = randi_range(5, 10)
		"shield":
			next_amount = randi_range(3, 8)
		_:
			pass

func play_action():
	match current_action:
		"attack":
			enemy_attack(player, current_amount)
		"heal":
			heal(current_amount)
		"shield":
			add_shield(current_amount)
		_:
			pass
	
	current_action = next_action
	current_amount = next_amount  # Carry over next_amount
	choose_next_action()
	actions_info.update_info()
	
	print("current action: " + str(current_action))
	print("next action: " + str(next_action))

func take_damage(amount, is_critical: bool = false):
	var remaining_damage = amount

	# First apply damage to shield
	if block_damage > 0:
		var blocked_amount = min(block_damage, remaining_damage)
		block_damage -= blocked_amount
		remaining_damage -= blocked_amount
		
		DamageNumbers.display_number(blocked_amount, damage_number_origin.global_position)
	
	if remaining_damage > 0:
		# Apply remaining damage to health
		current_health = clampi(current_health - remaining_damage, min_health, max_health)
		health_label.text = str(current_health)
		animation.play("hurt")  # Play hurt animation only if health is reduced

		# Display actual damage number
		DamageNumbers.display_number(remaining_damage, damage_number_origin.global_position, is_critical)
		health_bar.value = current_health

func heal(amount):
	current_health = clampi(current_health + amount, min_health, max_health)
	health_label.text = str(current_health)
	health_bar.value = current_health
	
	DamageNumbers.display_number(amount, damage_number_origin.global_position, false, true)
	

func add_shield(amount:int) -> void:
	block_damage += amount

func enemy_attack(player, amount):
	var original_pos = global_position

	animation.play("attack")

	# Ensure the node is in the tree before creating a tween
	if not is_inside_tree():
		push_error("Enemy is not in the scene tree, cannot create tween.")
		return

	var tween = get_tree().create_tween()
	if tween == null:
		push_error("Failed to create tween!")
		return

	tween.tween_property(self, "position:x", global_position.x - 30, 0.15).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUINT)
	await tween.finished  

	player.take_damage(amount)

	tween = get_tree().create_tween()  # Create a new tween for the return movement
	if tween == null:
		push_error("Failed to create return tween!")
		return

	tween.tween_property(self, "position", original_pos, 0.15).set_ease(Tween.EASE_OUT)
	await tween.finished  
	
func _on_animation_finished() -> void:
	animation.play("default")
