extends Node

@onready var player = get_tree().get_root().get_node("Board/Player/PlayerStats")

func _on_button_pressed() -> void:
	while(true):
		player.take_damage(50)
		print(str(player.health))
	pass # Replace with function body.
	
