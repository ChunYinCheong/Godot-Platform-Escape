extends Area2D

func _on_ReverseTileArea_body_entered(body):
	body.gravity = 0.0
	body.gravity_direction *= -1
	pass # Replace with function body.
