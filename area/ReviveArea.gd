extends Area2D

onready var revive_shape : CollisionShape2D

func _on_ReviveArea_body_shape_entered(body_id, body, body_shape, area_shape):
	var owner_id = shape_find_owner(area_shape)
	var shape_owner = shape_owner_get_owner(owner_id)
	# disabled not work!
	if not shape_owner.disabled:
		revive_shape = shape_owner 
		# revive_shape.disabled = true
		revive_shape.set_deferred("disabled", true)
		
#	print(area_shape, ' / ',owner_id, ' / ', revive_shape)
	pass # Replace with function body.
