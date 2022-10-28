extends Bullet

var direction: = Vector2.UP
var xAxisPoint: = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity = SPEED * direction
	var impactedEntity = move_and_collide(velocity * delta);
	#print(impactedEntity)
