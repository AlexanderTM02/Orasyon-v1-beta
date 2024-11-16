class_name BoardState
extends Node

## Hold a reference to the parent so that it can be controlled by the state
var parent:Node

func set_card_parent(board: Node) -> void:
	parent = board

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	return null

func process_physics(delta: float) -> BoardState:
	return null
