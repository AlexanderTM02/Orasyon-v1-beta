class_name Card
extends Container

var card_dictionary_resource = preload("res://entities/card/card_resources/card_dictionary.gd").new()
const red_background = preload("res://assets/card/card_base/bg_red.png")
const blue_backround = preload("res://assets/card/card_base/bg_blue.png")
const green_background = preload("res://assets/card/card_base/bg_green.png")
const purple_background = preload("res://assets/card/card_base/bg_purple.png")

const red_plate = preload("res://assets/card/card_base/little_red.png")
const blue_plate = preload("res://assets/card/card_base/little_brown.png") #change this
const green_plate = preload("res://assets/card/card_base/little_green.png")
const purple_plate = preload("res://assets/card/card_base/tittle_purple.png")

const SIZE := Vector2(125, 160)

var is_card_highlighted: bool = false

var card_id
var spell_name
var mana_cost
var spell_type
var attack_value
var defense_value
var heal_value
var spell_description

#get a random crad from the card dictionary
@onready var card = card_dictionary_resource.get_random_card()

#reference state_machine node
@onready var state_machine = $StateMachine
#reference label nodes
@onready var spell_name_label = $StatLabels/SpellNameLabel
@onready var mana_cost_label = $StatLabels/ManaCostLabel
@onready var heal_value_label = $StatLabels/HealValueLabel
@onready var attack_value_label = $StatLabels/AttackValueLabel
@onready var shield_value_label = $StatLabels/ShieldValueLabel

@onready var color_background: TextureRect = $Textures/ColorBG
@onready var card_art: TextureRect = $Textures/CardArt
@onready var card_nameplate: TextureRect = $Textures/CardNamePlate

@onready var animation_player = $AnimationPlayer
@onready var sfx_player = $SFXAudioStreamPlayer

@export var board: Node

func _ready() -> void:
	
	if card["card_art"] != null:
		card_art.texture = card["card_art"]
	else:
		card_art.texture = load("res://assets/card/card_art/missing.png")
		
	card_id = card["ID"]
	spell_name = card["name"]
	mana_cost = card["stats"]["mana_cost"]
	spell_type = card["spell_type"]
	attack_value = card["stats"]["damage"]
	defense_value = card["stats"]["shield"]
	heal_value = card["stats"]["heal"]
	spell_description = card["description"]
	
	update_card_colors()
	update_card_info()
	
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func update_card_info() -> void:
	
	spell_name_label.text = str(spell_name)
	mana_cost_label.text = str(mana_cost)
	
	if attack_value != 0:
		attack_value_label.text = str(attack_value)		
	if defense_value != 0:
		shield_value_label.text = str(defense_value)
	if heal_value != 0:
		heal_value_label.text = str(heal_value)
	else:
		pass

func update_card_colors() -> void:
	
	if spell_type == "Damage":
		color_background.texture = red_background
		card_nameplate.texture = red_plate
	elif spell_type == "Shield":
		color_background.texture = blue_backround
		card_nameplate.texture = blue_plate
	elif spell_type == "Heal":
		color_background.texture = green_background
		card_nameplate.texture = green_plate
	else:
		color_background.texture = purple_background
		card_nameplate.texture = purple_plate


func _on_mouse_entered() -> void:
	is_card_highlighted = true

func _on_mouse_exited() -> void:
	is_card_highlighted = false

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
