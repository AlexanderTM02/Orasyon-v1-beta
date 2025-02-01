extends Control

@onready var audio_stream_bgm = $AudioStreamBGM

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Settings.music_is_muted:
		if !audio_stream_bgm.playing:
			audio_stream_bgm.play()
	else:
		audio_stream_bgm.stop()
