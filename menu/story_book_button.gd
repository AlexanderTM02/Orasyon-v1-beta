extends TextureButton

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../../StoryBook".visible == false:
		$"..".show()


func _on_pressed() -> void:
	$"../../StoryBook".show()
	$"..".hide()
