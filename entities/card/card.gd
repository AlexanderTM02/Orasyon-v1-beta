class_name Card
extends Container

var card_dictionary_resource = preload("res://entities/card/card_resources/card_dictionary.gd").new()

var is_card_highlighted: bool = false

var spell_name
var mana_cost
var attack_value
var defense_value
var cast_time
var spell_description

@onready var random_card = card_dictionary_resource.get_random_card()

#reference state_machine node
@onready var state_machine = $StateMachine
#reference label nodes
@onready var spell_name_label = $StatLabels/SpellNameLabel
@onready var mana_cost_label = $StatLabels/ManaCostLabel
@onready var attack_value_label = $StatLabels/AttackValueLabel
@onready var cast_time_label = $StatLabels/CastTimeLabel
@onready var defence_value_label = $StatLabels/DefenseValue

@onready var animation_player = $AnimationPlayer

@onready var board = get_tree().get_root().get_node("Board")

func _ready() -> void:
	
	spell_name = random_card["name"]
	mana_cost = random_card["stats"]["mana_cost"]
	attack_value = random_card["stats"]["damage"]
	defense_value = random_card["stats"]["shield"]
	cast_time = random_card["stats"]["cast_time"]
	
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
	attack_value_label.text = str(attack_value)
	cast_time_label.text = str(cast_time)
	defence_value_label.text = str(defense_value)

func _on_mouse_entered() -> void:
	is_card_highlighted = true

func _on_mouse_exited() -> void:
	is_card_highlighted = false
