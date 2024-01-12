extends Area2D

func _on_SpringArea_body_entered(body):
	body.gravity = body.jump_force * 1.5
	pass # Replace with function body.
