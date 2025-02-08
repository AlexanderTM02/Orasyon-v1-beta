extends BoardState

@export var win_loss_check: BoardState

@onready var next_state: bool = false
@onready var player = $"../../Entities/PlayerCharacter"
@onready var enemy = $"../../Entities/EnemyCharacter"

@onready var audio_stream_player_sfx: AudioStreamPlayer = $"../../AudioStreamPlayerSFX"
const HIT_PUNCH_ = preload("res://assets/audio/sfx/hit(punch).wav")

func enter() -> void:
	
	enemy.play_action()
	
	
	audio_stream_player_sfx.stream = HIT_PUNCH_
	audio_stream_player_sfx.play()
	next_state = true

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state:
		return win_loss_check
	return null
