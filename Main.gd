extends Node

export(PackedScene) var bicho_scene

func _ready():
	randomize()
	new_game()


func _on_BichoTimer_timeout():
	var mob = bicho_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("BichoPath/BichoSpawnLocation")
	mob_spawn_location.offset = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	mob.init($Player)
	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func game_over():
	$BichoTimer.stop()

func new_game():
	$Player.start($StartPosition.position)
