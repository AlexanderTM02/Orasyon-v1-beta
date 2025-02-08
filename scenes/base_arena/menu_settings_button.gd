extends TextureButton


func _on_pressed() -> void:
	$"../MenuSettings".show()
	$"../../UI".hide()
	$"../../PlayerHud".hide()

func _process(delta: float) -> void:
	if $"../MenuSettings".visible == false:
		$"../../UI".show()
		$"../../PlayerHud".show()
