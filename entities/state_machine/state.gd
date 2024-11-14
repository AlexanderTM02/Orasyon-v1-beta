class_name State
extends Node

## Hold a reference to the parent so that it can be controlled by the state
var parent:Card

func set_card_parent(card: Card) -> void:
	parent = card

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
