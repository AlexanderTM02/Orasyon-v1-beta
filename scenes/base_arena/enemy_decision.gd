extends BoardState

@export var activation_state: BoardState
@export var enemy: Node

@onready var next_state: bool = false

var current_action
var current_amount

var next_action
var next_amount

func enter() -> void:
	current_action = enemy.current_action
	
	current_action = enemy.current_action
	next_action = enemy.next_action
	
	current_amount = enemy.current_amount
	next_amount = enemy.next_amount
	
	await Utilities.wait_seconds(0.2)
	next_state = true

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state:
		return activation_state
	return null
