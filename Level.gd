extends Node2D

onready var gear = preload("res://gear/Gear.tscn")

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_gear()

func _process(_delta):
	$Score.text = "Points: " + str(score)
	
func add_gear():
	print("Adding new gear")
	var instance = gear.instance()
	var viewport = get_viewport().size
	
	instance.position = Vector2(rand_range(0, viewport.x), rand_range(0, viewport.y))
	
	instance.connect("gear_used", self, "spawn_new")
	
	add_child(instance)
	
	print("Added new gear at: ", instance.position)
	
func spawn_new():
	score += 1
	add_gear()
	
	get_node("Head").add_tail()
