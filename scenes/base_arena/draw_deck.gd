extends Sprite2D

@export var draw_pile: Node
@onready var num_of_cards_in_draw_pile_label: Label = $NumOfCardsInDrawPile


var num_of_cards_in_draw_pile

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	num_of_cards_in_draw_pile = draw_pile.draw_pile.size()
	num_of_cards_in_draw_pile_label.text = str(num_of_cards_in_draw_pile)
