extends Actor


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
