extends Control

func _on_difficulty_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/base_arena/arena.tscn")
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	$".".hide()
	$"../Logo".show()
	$"../MainButtons".show()
	pass # Replace with function body.
