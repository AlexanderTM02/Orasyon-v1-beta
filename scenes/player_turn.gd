extends BoardState

@export var activating_state: BoardState

var button_pressed: bool = false

@onready var end_turn: Button = $"../../UI/EndTurn"


func enter() -> void:
	end_turn.show()
	print("in playerturn")

func exit() -> void:
	end_turn.hide()

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if button_pressed == true:
		button_pressed = false
		return activating_state
	return null

func _on_end_turn_pressed() -> void:
	button_pressed = true
	pass # Replace with function body.
