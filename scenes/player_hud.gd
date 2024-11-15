extends Control

@onready var player = $"../../Entities/Player"
@onready var player_mana_label: Label = $Mana/PlayerManaLabel
@onready var player_health_label: Label = $ColorRect/PlayerHealthLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_mana_label.text = str(player.current_mana)
	player_health_label.text = str(player.current_health)
