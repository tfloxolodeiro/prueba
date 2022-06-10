extends Area2D

export(PackedScene) var bullet_scene
var type 

func init(_position, _type):
	type = _type
	position = _position

func should_shoot():
	return type.should_shoot() && $ShootingCooldown.get_time_left() == 0

func aim_direction():
	return (type.aim_position() - global_position).normalized()

func bullet_initial_position():
	return global_position + aim_direction() * 50

func shoot():
	var bullet = bullet_scene.instance()
	bullet.init(bullet_initial_position(), aim_direction())
	find_parent("Main").add_child(bullet)
	$ShootingCooldown.start()

func _process(delta):
	look_at(type.aim_position())
	
	if should_shoot():
		shoot()


	
