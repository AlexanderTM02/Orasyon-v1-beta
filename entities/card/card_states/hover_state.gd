extends State

@export var idle_state: State
@export var clicked_state: State

@onready var card_description_canvas = get_tree().get_root().get_node("Board/CardDescription")

func enter() -> void:
	parent.animation_player.play("select")

func exit() -> void:
	parent.animation_player.play("deselect")


func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			return clicked_state
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			var pop_up = card_description_canvas.get_child(0)
			pop_up.show()
			pop_up.enter(parent)
			
			pass
	return null

func process_frame(delta: float) -> State:
	if parent.is_card_highlighted == false:
		return idle_state
	return null
