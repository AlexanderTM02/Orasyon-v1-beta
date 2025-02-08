extends Control

@onready var page_1: Control = $Page1
@onready var page_2: Control = $Page2

func _ready() -> void:
	page_1.show()
	page_2.hide()


func _on_next_button_pressed() -> void:
	page_1.hide()
	page_2.show()


func _on_back_button_pressed() -> void:
	page_2.hide()
	page_1.show()

func _on_exit_button_pressed() -> void:
	self.hide()
