extends KinematicBody2D

export var speed = 200
var velocity = Vector2()
var player

func init(_player):
	player = _player

func direction_to_move():
	var direction_to_move = player.position - position
	return direction_to_move.normalized()

func _physics_process(_delta):
	var instant_velocity = direction_to_move() * speed
	velocity = move_and_slide(instant_velocity)

func hit():
	queue_free()
