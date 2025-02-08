extends TextureButton

const MENU_SETTINGS = preload("res://menu/pop_ups/menu_settings.tscn")

func _on_pressed() -> void:
	$"../../MenuSettings".show()
	$"..".hide()

func _process(delta: float) -> void:
	if $"../../MenuSettings".visible == false:
		$"..".show()
