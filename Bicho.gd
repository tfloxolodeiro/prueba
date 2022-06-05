extends KinematicBody2D

export var health = 3
export var baseScale = Vector2(0.1,0.1)
export var baseSpeed = 200
var velocity = Vector2()
var player

func init(_player):
	player = _player
	scale = size()

func direction_to_move():
	var direction_to_move = player.position - position
	return direction_to_move.normalized()

func _physics_process(_delta):
	var instant_velocity = direction_to_move() * speed()
	velocity = move_and_slide(instant_velocity)
	scale = size()

func size():
	return baseScale * health

func speed(): 
	if health != 0: #Una vez exploto por entrar aca con health 0 xd
		return baseSpeed / health
	else:
		return 0

func hit():
	health -= 1
	if health == 0:
		queue_free()
