extends Area2D

export(PackedScene) var bullet_scene
var type 

func init(_position, _type):
	type = _type
	position = _position

func should_shoot():
	return type.should_shoot() && $ShootingCooldown.get_time_left() == 0

func aim_rotation():
	return (type.aim_position() - global_position).angle()

func shoot():
	var bullet = bullet_scene.instance()
	bullet.init(global_position, aim_rotation())
	find_parent("Main").add_child(bullet)
	$ShootingCooldown.start()

func _process(delta):
	look_at(type.aim_position())
	
	if should_shoot():
		shoot()


	
