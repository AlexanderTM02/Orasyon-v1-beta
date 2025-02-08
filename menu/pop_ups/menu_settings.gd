extends Control

@onready var music_slider: HSlider = $MusicSlider
@onready var sfx_slider: HSlider = $SFXSlider


func _ready() -> void:
	music_slider.set_value_no_signal(Settings.music_volume)
	
	sfx_slider.set_value_no_signal(Settings.sfx_volume)

func _on_texture_button_pressed() -> void:
	self.hide()

func _on_music_slider_value_changed(value: float) -> void:
	Settings.music_volume = music_slider.value
	print("music: " + str(Settings.music_volume))

func _on_sfx_slider_value_changed(value: float) -> void:
	Settings.sfx_volume = sfx_slider.value
	print("sfx: " + str(Settings.sfx_volume))
