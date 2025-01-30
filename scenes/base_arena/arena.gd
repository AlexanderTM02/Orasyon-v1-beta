extends Node

@onready var board_states: Node = $BoardStates
@onready var audio_stream_bgm = $AudioStreamPlayerBGM

var bgm_muted = true

func _ready() -> void:
	board_states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	board_states.process_input(event)

func _physics_process(delta: float) -> void:
	board_states.process_physics(delta)

func _process(delta: float) -> void:
	board_states.process_frame(delta)
	
	if !bgm_muted:
		if !audio_stream_bgm.playing:
			audio_stream_bgm.play()
	else:
		audio_stream_bgm.stop()
