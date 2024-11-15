extends State

@export var idle_state: State
@export var onboard_state: State

var original_position: Vector2
var drag_offset: Vector2

@onready var placement_area = get_tree().get_root().get_node("Board/UI/PlacementArea")

func enter() -> void:
	original_position =  parent.global_position
	drag_offset = Vector2.ZERO
	drag_offset = parent.get_global_mouse_position() - parent.global_position

func exit() -> void:
	parent.is_card_highlighted = false

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			if placement_area.get_global_rect().has_point(parent.get_global_position()):
				var new_card_parent = get_tree().get_root().get_node("Board/UI/PlacementArea/CardPlacement")
				if new_card_parent == parent.get_parent():
					parent.global_position = original_position
				else:
					parent.reparent(new_card_parent)
				return idle_state
			else:
				var new_card_parent = get_tree().get_root().get_node("Board/UI/PlayerHand")
				if new_card_parent == parent.get_parent():
					parent.global_position = original_position
				else:
					parent.reparent(new_card_parent)
				return idle_state
	return null

func process_frame(delta: float) -> State:
	parent.global_position = parent.get_global_mouse_position() - drag_offset
	return null
