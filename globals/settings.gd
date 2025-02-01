extends Node


@export var music_is_muted:bool = false
@export var sfx_is_muted: bool = false

@export var music_volume = 1
@export var sfx_volume = 1

@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
@onready var SFX_BUS_ID = AudioServer.get_bus_index("SFX")

@onready var current_level = 1

func _process(delta: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, music_volume)
	AudioServer.set_bus_volume_db(SFX_BUS_ID, sfx_volume)
	
	print(str(sfx_volume))
