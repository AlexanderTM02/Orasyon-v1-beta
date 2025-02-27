extends Node

@export var starting_state: BoardState

var current_state: BoardState

func init(parent:Node) -> void:
	for child in get_children():
		if child is State:
			child.set_card_parent(parent)
	
	change_state(starting_state)

func change_state(new_state: BoardState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	print("curret state: " + str(current_state))
	current_state.enter()

func process_physics(delta:float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
