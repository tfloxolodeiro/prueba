extends KinematicBody2D
export(PackedScene) var gun_scene

signal hit

export var speed = 400
var velocity = Vector2()
	
func _ready():
	var gun = gun_scene.instance()
	gun.init(Vector2(), $PlayerGun)
	add_child(gun)
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func _on_Player_body_entered(_body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	#"Using set_deferred() tells Godot to wait to disable the shape until it's safe to do so."
	$CollisionShape2D.set_deferred("disabled", true) 
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
