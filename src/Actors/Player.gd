extends Actor

const bulletPath = preload('res://src/Bullets/PlayerBullet.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	var direction: = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	if direction.y == 0:
		velocity.y = lerp(velocity.y, 0, FRICTION)
	if direction.x == 0:
		velocity.x = lerp(velocity.x, 0, FRICTION)
	if direction.x != 0 or direction.y != 0:
		velocity = SPEED * direction
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bulletPath.instance()
	get_tree().get_root().get_node("Level").add_child(bullet)
	bullet.global_position = $Maingun.global_position
	
