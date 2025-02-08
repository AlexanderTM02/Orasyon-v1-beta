extends Sprite2D


@export var discard_pile: Node
@onready var discard_label: Label = $DiscardLabel

var num_in_discard


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	num_in_discard = discard_pile.discarded_cards.size()
	discard_label.text = str(num_in_discard)
