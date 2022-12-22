extends Node2D

var direction = Vector2(0,0)
var gap = -100
var next_direction = Vector2(1,0)
var previous_direction = Vector2(1,0)
# Speed multiplier, applied to direction
var speed = 1

onready var tail = preload("res://snake/Body.tscn")

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
	# Get the root node
	var node = get_node(".")
	
	var head_position = node.position
	
	node.position += direction * delta * 100 / 2
	
	if previous_direction != direction:
		previous_direction = direction
		for i in range(2, get_child_count()):
			get_child(i).add_to_tail(head_position, direction)

func add_tail():
	var instance = tail.instance()
	
	var previous_tail = get_child(get_child_count() - 1)
	
	if previous_tail.is_class("Area2D") and previous_tail.name != "Head":
		instance.current_direction = previous_tail.current_direction
		
		for i in range(previous_tail.positions.size()):
			instance.positions.append(previous_tail.positions[i])
			instance.directions.append(previous_tail.directions[i])
		
		instance.position = previous_tail.position + previous_tail.current_direction * gap
	else:
		instance.current_direction = direction
		instance.position = previous_tail.position + direction * gap
		
	add_child(instance)
