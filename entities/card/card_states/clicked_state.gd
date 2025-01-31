extends State

@export var dragging_state: State
@export var hover_state: State

var mouse_held: bool = false

@onready var sfx_audio_stream_player: AudioStreamPlayer = $"../../SFXAudioStreamPlayer"

const CLICKED_SFX = preload("res://assets/audio/sfx/click1.wav")

func enter() -> void:
	sfx_audio_stream_player.stream = CLICKED_SFX
	sfx_audio_stream_player.play()
	mouse_held = true
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			mouse_held = false
			return hover_state
	
	return null

func process_frame(delta: float) -> State:
	if mouse_held:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#check if mouse is moving, if moving move to dragginf state
			var mouse_velocity = Input.get_last_mouse_velocity()
			if mouse_velocity.length() > 20: 
				return dragging_state
	return null

func process_physics(delta: float) -> State:
	return null
