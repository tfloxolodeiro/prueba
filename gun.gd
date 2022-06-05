extends Area2D

export(PackedScene) var bullet_scene

func should_shoot():
	return Input.is_action_pressed("shoot") && $ShootingCooldown.get_time_left() == 0

func aim_rotation():
	return (get_global_mouse_position() - global_position).angle()

func shoot():
	var bullet = bullet_scene.instance()
	bullet.init(global_position, aim_rotation())
	owner.owner.add_child(bullet)
	$ShootingCooldown.start()

func _process(delta):
	look_at(get_global_mouse_position())
	
	if should_shoot():
		shoot()


	
