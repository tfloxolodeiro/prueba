extends KinematicBody2D

var speed = 750
var velocity = Vector2()

func init(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
