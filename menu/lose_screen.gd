extends Control


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/main_menu.tscn")


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/base_arena/arena.tscn")
	pass # Replace with function body.
