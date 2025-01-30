extends Control

@onready var player = $"../../Entities/PlayerCharacter"
@onready var player_mana_label: Label = $ManaIcon/PlayerManaLabel
@onready var player_health_label: Label = $HealthIcon/PlayerHealthLabel
@onready var player_shield_label: Label = $HealthIcon/PlayerShieldLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_mana_label.text = str(player.current_mana)
	player_health_label.text = str(player.current_health)
	player_shield_label.text = str(player.block_damage)
