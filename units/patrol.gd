extends Node2D

var speed = 300
var patrol : Array = []
var patrol_index = 0

func _ready():
	patrol.append(global_position)
	for child in get_children():
		if child is Position2D:
			patrol.append(child.global_position)
	pass # Replace with function body.


func _physics_process(delta):
	if patrol.size() == 1:
		return
		
	var pos : Vector2 = patrol[patrol_index]
	var sd = speed * delta
	if (pos - global_position).length() < sd:
		global_position = pos
		patrol_index += 1
		if patrol_index >= patrol.size():
			patrol_index = 0
	else:
		var m = (pos - global_position).normalized() * sd
		global_position += m	
		
	pass
