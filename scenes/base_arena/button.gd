extends Button

@onready var hand = $"../UI/PlayerHand"

func _on_pressed() -> void:
	hand.draw()
