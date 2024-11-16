extends BoardState

@export var activating_state: BoardState

@onready var next_state: bool = false
@onready var player: Enemy = $"../../Entities/Player"


func enter() -> void:
	var random_damage = randi_range(1, 100)
	player.take_damage(random_damage)
	print(str(random_damage))
	next_state = true

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state:
		return activating_state
	return null
