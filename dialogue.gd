extends Control

@onready var Level1Dialogue = load("res://scenes/dialogue/level_1_dialogue.gd").new()
@onready var Level2Dialogue = load("res://scenes/dialogue/level_2_dialogue.gd").new()
@onready var Level3Dialogue = load("res://scenes/dialogue/level_3_dialogue.gd").new()


var dialogues = {
		"dialogue1": {
			"name": "SYSTEM",
			"text": [
				"Yeah you have no dialogues"
		]
	}
}

signal dialogue_finished

var text_index: int = 0
var dialogue_keys = []
var dialogue_index: int = 0

var current_level = Settings.current_level

var is_complete: bool = true
var is_skipping: bool = false

@export var dialogue_label: Label
@export var name_label: Label
@export var click_label: Label
@export var reveal_spead: float = 0.01 #time reveal for each character

@export var character_sprite:TextureRect

var enemy_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if current_level == 1:
		dialogues = Level1Dialogue.dialogues
		enemy_sprite = $DuwendeSprite
	elif  current_level == 2:
		dialogues = Level2Dialogue.dialogues
		enemy_sprite = $MananangalSprite
	elif current_level == 3:
		dialogues = Level3Dialogue.dialogues
		enemy_sprite = $KapreSprite
	else:
		enemy_sprite = $KapreSprite
		printerr("No Dialogue Found")
		
	enemy_sprite.show()
	
	dialogue_keys = get_dialogue_keys()
	update_dialogue()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if (event.button_index != MOUSE_BUTTON_WHEEL_UP and 
			event.button_index != MOUSE_BUTTON_WHEEL_DOWN):
			if is_complete:
				next_dialogue()
			else:
				is_skipping = true

func update_dialogue() -> void:
	if dialogue_label and name_label and dialogue_index < dialogue_keys.size():
		var current_key = dialogue_keys[dialogue_index]
		var current_dialogue = dialogues[current_key]
		
		name_label.text = current_dialogue["name"]
		dialogue_label.text = current_dialogue["text"][text_index]
		
		reveal_text(dialogue_label, current_dialogue["text"][text_index])


func next_dialogue() -> void:
	text_index += 1
	var current_key = dialogue_keys[dialogue_index]
	if text_index >= len(dialogues[current_key]["text"]):
		text_index = 0 #reset text
		
		if dialogue_index < len(dialogue_keys) - 1:
			dialogue_index += 1 
		else:
			emit_signal("dialogue_finished")
			print("dialogue finished")
			dialogue_label.text = "End of Dialogue"
			return
	
	update_dialogue()

func get_dialogue_keys():
	return dialogues.keys()

func reveal_text(label: Label, new_text: String) -> void:
	label.text = ""
	is_complete = false
	click_label.text = "click to skip"
	
	for character in range(new_text.length()):
		
		if is_skipping:
			label.text = new_text
			is_complete = true
			is_skipping = false
			click_label.text = "click to next"
			return
		
		label.text += new_text[character]
		await get_tree().create_timer(reveal_spead).timeout
	
	is_complete = true
	click_label.text = "click to next"
