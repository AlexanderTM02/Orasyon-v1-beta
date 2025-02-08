extends TextureButton

func _on_pressed() -> void:
	$"..".hide()
	$"../../Tutorial".show()
	
func _process(delta: float) -> void:
	if $"../../Tutorial".visible == false:
		$"..".show()
