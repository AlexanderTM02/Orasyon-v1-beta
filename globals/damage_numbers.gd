extends Node

func display_number(value: int, position: Vector2, is_critical: bool = false, is_healing: bool = false):
	var number = Label.new()
	number.global_position = position
	number.text = str(value)
	number.z_index = 5
	number.label_settings = LabelSettings.new()
	
	var color = "#FFF"
	var font_size = 40
	
	if is_healing:
		color = "#080"
	if is_critical:
		color = "#B22"
		font_size = 100
	if value == 0: #if no value, make text transparent
		color = "#FFF8"
	
	number.label_settings.font_color = color 
	number.label_settings.font_size = font_size
	number.label_settings.outline_color = "#000"
	number.label_settings.outline_size = 5
	
	call_deferred("add_child", number)
	
	await number.resized
	number.pivot_offset = Vector2(number.size / 2)
	
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(
		number, "position:y", number.position.y - 24, 0.25
	).set_ease(Tween.EASE_OUT)
	tween.tween_property(
		number, "position:y", number.position.y, 0.25
	).set_ease(Tween.EASE_IN).set_delay(0.25)
	tween.tween_property(
		number, "scale", Vector2.ZERO, 0.25
	).set_ease(Tween.EASE_IN).set_delay(0.5)
	
	await tween.finished
	number.queue_free()
	
