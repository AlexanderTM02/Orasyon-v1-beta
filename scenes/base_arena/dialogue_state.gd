extends BoardState

@export var drawing_state: BoardState

@onready var pop_ups: CanvasLayer = $"../../PopUps"
@onready var card_description: CanvasLayer = $"../../CardDescription"
@onready var ui: CanvasLayer = $"../../UI"
@onready var player_hud: CanvasLayer = $"../../PlayerHud"

@onready var dialogue: CanvasLayer = $"../../Dialogue"

@onready var next_state: bool = false

func enter() -> void:
	pop_ups.hide()
	card_description.hide()
	hide_children(ui)
	hide_children(player_hud)
	
	dialogue.show()

func exit() -> void:
	print("show")
	pop_ups.show()
	card_description.show()
	show_children(ui)
	show_children(player_hud)
	
	player_hud.get_node("NotEnoughManaLabel").hide()
	
	dialogue.hide()
	dialogue.queue_free()

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state == true:
		return drawing_state
	return null

func _on_dialogue_dialogue_finished() -> void:
	next_state = true
	print("bro")

func hide_children(parent):
	for child in parent.get_children():
		if child.has_method("hide"):
			child.hide()

func show_children(parent):
	for child in parent.get_children():
		if child.has_method("show"):
			child.show()
