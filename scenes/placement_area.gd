extends Control


func is_mouse_in_control(control: Control) -> bool:
	"""
	Checks if the mouse position is inside a Control node.
	
	Parameters:
	control (Control): The Control node to check.
	
	Returns:
	bool: True if the mouse is inside the Control node, False otherwise.
	"""
	var mouse_pos = get_global_mouse_position()
	var control_rect = control.get_global_rect()
	return control_rect.has_point(mouse_pos)
