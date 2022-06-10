extends "res://Bicho.gd"

export var shooting_distance = 300

func distance_to_player():
	return global_position.distance_to(player.global_position)

func move():
	if distance_to_player() > shooting_distance:
		.move()
