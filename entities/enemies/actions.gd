extends Control

@onready var current_amount_label: Label = $CurrentAmount
@onready var next_amount_label: Label = $NextAmount
@export var parent: Node

@onready var current_icon = $CurrentAction/Damage
@onready var next_icon = $CurrentAction/Damage

var current_action
var next_action

var current_amount
var next_amount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent.init_current_action()
	
	current_action = parent.current_action
	next_action = parent.next_action
	
	current_amount = parent.current_amount
	next_amount = parent.next_amount
	
	update_info()

func update_info():
	
	current_action = parent.current_action
	next_action = parent.next_action
	
	current_amount = parent.current_amount
	next_amount = parent.next_amount
	# Hide all icons first
	$CurrentAction/Damage.hide()
	$CurrentAction/Heal.hide()
	$CurrentAction/Shield.hide()
	
	$NextAction/Damage.hide()
	$NextAction/Heal.hide()
	$NextAction/Shield.hide()
	
	# Determine which icon to show for current action
	match current_action:
		"attack":
			current_icon = $CurrentAction/Damage
		"heal":
			current_icon = $CurrentAction/Heal
		"shield":
			current_icon = $CurrentAction/Shield
	
	# Determine which icon to show for next action
	match next_action:
		"attack":
			next_icon = $NextAction/Damage
		"heal":
			next_icon = $NextAction/Heal
		"shield":
			next_icon = $NextAction/Shield
	
	next_icon.show()
	current_icon.show()
	
	# Update action amounts
	current_amount_label.text = str(current_amount)
	next_amount_label.text = str(next_amount)
