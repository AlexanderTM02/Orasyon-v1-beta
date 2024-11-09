extends Node

var card_selected
var mouse_on_placement = false


func _on_placement_area_mouse_entered() -> void:
	mouse_on_placement = true
	print("inside")
	pass # Replace with function body.


func _on_placement_area_mouse_exited() -> void:
	mouse_on_placement = false
	print("outside")
	pass # Replace with function body.
