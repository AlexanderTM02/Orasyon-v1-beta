class_name Card
extends Container

var card_dictionary_resource = preload("res://entities/card/card_resources/card_dictionary.gd").new()

const SIZE := Vector2(100, 130)

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
@onready var random_card = card_dictionary_resource.get_random_card()

#reference state_machine node
@onready var state_machine = $StateMachine
#reference label nodes
@onready var spell_name_label = $StatLabels/SpellNameLabel
@onready var mana_cost_label = $StatLabels/ManaCostLabel
@onready var effect_value_label = $StatLabels/EffectValueLabel

@onready var card_art: TextureRect = $Textures/CardArt
@onready var effect_value_bg = $Textures/EffectValueBackground
@onready var animation_player = $AnimationPlayer

@onready var board = get_tree().get_root().get_node("Board")


func _ready() -> void:
	
	if random_card["card_art"] != null:
		card_art.texture = random_card["card_art"]
	else:
		card_art.texture = load("res://assets/card/card_art/missing.png")
	
	
	#get card values from the random card dictionary
	card_id = random_card["ID"]
	spell_name = random_card["name"]
	mana_cost = random_card["stats"]["mana_cost"]
	spell_type = random_card["spell_type"]
	attack_value = random_card["stats"]["damage"]
	defense_value = random_card["stats"]["shield"]
	heal_value = random_card["stats"]["heal"]
	
	update_card_info()
	
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func update_card_info() -> void:
	spell_name_label.text = spell_name
	mana_cost_label.text = str(mana_cost)
	
	if attack_value != 0:
		effect_value_label.text = str(attack_value)
		effect_value_bg.set_color(Color.DARK_RED)
	elif defense_value != 0:
		effect_value_label.text = str(defense_value)
		effect_value_bg.set_color(Color.ROYAL_BLUE)
	elif heal_value != 0:
		effect_value_label.text = str(heal_value)
		effect_value_bg.set_color(Color.LIME_GREEN)
	else:
		print("no effect")
		effect_value_bg.set_color(Color.PURPLE)


func _on_mouse_entered() -> void:
	is_card_highlighted = true

func _on_mouse_exited() -> void:
	is_card_highlighted = false

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
