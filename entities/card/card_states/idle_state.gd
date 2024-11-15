extends State

@export var dragging_state: State
@export var hover_state: State
@export var clicked_state: State

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	if parent.is_card_highlighted == true:
		return hover_state
	return null
