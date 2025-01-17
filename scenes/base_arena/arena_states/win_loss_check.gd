extends BoardState

@export var Drawing_state: BoardState

@onready var player = $"../../Entities/PlayerCharacter"
@onready var enemy = $"../../Entities/EnemyCharacter"
@onready var win_loss: CanvasLayer = $"../../WinLoss"

const WIN_SCREEN = preload("res://menu/win_screen.tscn")
const LOSE_SCREEN = preload("res://menu/lose_screen.tscn")


var next_state: bool

func enter() -> void:
	print("entered")
	
	if player.current_health <= 0:
		show_screen(LOSE_SCREEN)
	elif enemy.current_health <= 0:
		show_screen(WIN_SCREEN)
		
	next_state = true
	
func exit() -> void:
	pass

func process_input(event: InputEvent) -> BoardState:
	return null

func process_frame(delta: float) -> BoardState:
	if next_state:
		return Drawing_state
	return null

func show_screen(screen) -> void:
	var screen_instance = screen.instantiate()
	win_loss.add_child(screen_instance)
