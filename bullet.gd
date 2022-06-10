extends KinematicBody2D
export var baseScaleFactor = 0.5
var baseScale = Vector2(baseScaleFactor,baseScaleFactor)
var speed = 750
var velocity = Vector2()

func init(_position, direction):
	rotation = direction.angle()
	position = _position
	scale = baseScale
	velocity = Vector2(speed, 0).rotated(rotation)

func collide(collision):
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			queue_free()

func percentage_time_left():
	return $LifeTimer.time_left / $LifeTimer.wait_time

func process_life_time():
	var time_left = $LifeTimer.time_left 
	if time_left == 0:
		queue_free()
	else:
		scale = baseScale * percentage_time_left() 
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	collide(collision)
	process_life_time()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
