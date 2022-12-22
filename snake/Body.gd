extends Area2D

var current_direction = Vector2(0,0)
var directions = []
var positions = []

func _process(_delta):
	position = current_direction / 2
	
	if (directions.size() > 0):
		if (position == positions[0]):
			current_direction = directions[0]

func remove_from_tail():
	directions.pop_front()
	positions.pop_front()
	
func add_to_tail(head_position, direction):
	positions.append(head_position)
	directions.append(direction)

func _on_Body_area_entered(area):
	if (area.name == "Head"):
		get_tree().reload_current_scene()
