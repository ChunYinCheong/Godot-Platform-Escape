extends Area2D

func _on_ReverseFallArea_body_entered(body):
	body.gravity = 1200.0
	body.gravity_direction *= -1
	pass # Replace with function body.
