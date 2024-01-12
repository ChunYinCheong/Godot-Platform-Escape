extends Area2D


func _on_EndArea_body_shape_entered(body_id, body, body_shape, area_shape):
	get_tree().change_scene("res://MainMenu.tscn")
	pass # Replace with function body.
