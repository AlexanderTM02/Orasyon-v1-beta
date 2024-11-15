extends State

@export var idle_state: State
@export var clicked_state: State

func enter() -> void:
	parent.animation_player.play("select")

func exit() -> void:
	parent.animation_player.play("deselect")


func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			return clicked_state
	return null

func process_frame(delta: float) -> State:
	if parent.is_card_highlighted == false:
		return idle_state
	return null
