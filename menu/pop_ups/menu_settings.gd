extends Control

@onready var music_slider: HSlider = $MusicSlider
@onready var sfx_slider: HSlider = $SFXSlider


func _ready() -> void:
	music_slider.min_value = -50
	music_slider.max_value = 1
	
	music_slider.value = Settings.music_volume
	
	sfx_slider.min_value = -50
	sfx_slider.max_value = 1
	
	music_slider.value = Settings.sfx_volume
	

func _on_texture_button_pressed() -> void:
	self.hide()


func _on_music_slider_value_changed(value: float) -> void:
	Settings.music_volume = value
	pass # Replace with function body.


func _on_sfx_slider_value_changed(value: float) -> void:
	Settings.sfx_volume = value
	pass # Replace with function body.
