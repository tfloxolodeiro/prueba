extends "res://Bicho.gd"

export(PackedScene) var gun_scene
export var shooting_distance = 300

func _ready():
	var gun = gun_scene.instance()
	$ShooterGun.init(player)
	gun.init(Vector2(), $ShooterGun)
	add_child(gun)

func distance_to_player():
	return global_position.distance_to(player.global_position)

func move():
	if distance_to_player() > shooting_distance:
		.move()
