extends Node

func wait_seconds(duration: float):
	await get_tree().create_timer(duration).timeout
