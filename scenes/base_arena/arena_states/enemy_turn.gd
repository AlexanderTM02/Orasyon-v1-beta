extends BoardState

@export var activating_state: BoardState
@export var win_loss_check: BoardState

@onready var next_state: bool = false
@onready var player = $"../../Entities/PlayerCharacter"
@onready var enemy = $"../../Entities/EnemyCharacter"


func enter() -> void:
	enemy.enemy_attack(player)
	next_state = true

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state:
		return activating_state
	return null
