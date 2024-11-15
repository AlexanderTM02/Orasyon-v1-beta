extends Node

@onready var board_states: Node = $BoardStates


func _ready() -> void:
	board_states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	board_states.process_input(event)

func _physics_process(delta: float) -> void:
	board_states.process_physics(delta)

func _process(delta: float) -> void:
	board_states.process_frame(delta)
