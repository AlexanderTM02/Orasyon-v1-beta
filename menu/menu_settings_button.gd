extends TextureButton

const MENU_SETTINGS = preload("res://menu/pop_ups/menu_settings.tscn")

func _on_pressed() -> void:
	$"../../Logo".hide()
	$"..".hide()
	$"../../MenuSettings".show()
