extends Area2D

signal gear_used

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("New Gear has been created")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Gear_area_entered(area):
	print(area.name)
	if (area.name == "Head"):
		queue_free()
		emit_signal("gear_used")
