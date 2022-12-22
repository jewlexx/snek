extends Node2D

var direction = Vector2(0,0)
# Speed multiplier, applied to direction
var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Delta is the time since the last frame
func _process(delta):
	if (Input.is_action_just_pressed("ui_up")):
		direction = Vector2(0,-5)
	elif (Input.is_action_just_pressed("ui_down")):
		direction = Vector2(0,5)
	elif (Input.is_action_just_pressed("ui_left")):
		direction = Vector2(-5,0)
	elif (Input.is_action_just_pressed("ui_right")):
		direction = Vector2(5,0)
		
	direction = direction * speed
		
	move_snake(delta)

func move_snake(delta):
	var node = get_node("Head")
	
	node.position += direction * delta * 100 / 2
