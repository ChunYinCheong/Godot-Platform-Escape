extends KinematicBody2D

signal died

var gravity_direction = 1
var gravity : float = 0
var gravity_max : float = 490
var gravity_accelerate : float = 980

var movement_speed : float = 522
var boost : float = 0

var jump_force : float = -490
var bounce_force : float = 490
var force_reduce : float = 1960
var horizontal_force : float = 0
var is_moving_right : bool = false
var is_moving_left : bool = false
var is_pressing_right : bool = false
var is_pressing_left : bool = false
var can_double_jump : bool = false

func _physics_process(delta):
	if gravity > gravity_max:
		gravity -= gravity_accelerate * delta
		if gravity < gravity_max:
			gravity = gravity_max
	elif gravity < gravity_max:
		gravity += gravity_accelerate * delta
		if gravity > gravity_max:
			gravity = gravity_max
	
	if horizontal_force != 0:
		# print("horizontal_force" + str(horizontal_force))
		var fr = force_reduce * delta
		if abs(horizontal_force) <= fr:
			horizontal_force = 0
		elif horizontal_force > 0:
			horizontal_force -= fr
		elif horizontal_force < 0:
			horizontal_force += fr
		else:
			print("?")
	
	# Horizontal movement
	var target_speed = boost * movement_speed + horizontal_force
	move_and_collide(Vector2(target_speed*delta, 0))


	# Reset Double
	if gravity_direction == 1 and $Bottom.get_overlapping_bodies().size() > 0:
		can_double_jump = true
	elif gravity_direction == -1 and $Top.get_overlapping_bodies().size() > 0:
		can_double_jump = true

	# Jumping
	if Input.is_action_just_pressed("jump"):
		if gravity_direction == 1 and $Bottom.get_overlapping_bodies().size() > 0:
			gravity = jump_force
			can_double_jump = true
			print("Jump up")
		elif gravity_direction == -1 and $Top.get_overlapping_bodies().size() > 0:
			gravity = jump_force
			can_double_jump = true
			print("Jump up")
		elif gravity_direction == 1 and $BottomLeft.get_overlapping_bodies().size() > 0:
			gravity = jump_force
			horizontal_force = bounce_force
			can_double_jump = true
			print("Jump left")
		elif gravity_direction == -1 and $TopLeft.get_overlapping_bodies().size() > 0:
			gravity = jump_force
			horizontal_force = bounce_force
			can_double_jump = true
			print("Jump left")
		elif gravity_direction == 1 and $BottomRight.get_overlapping_bodies().size() > 0:
			gravity = jump_force
			horizontal_force = -bounce_force			
			can_double_jump = true
			print("Jump right")
		elif gravity_direction == -1 and $TopRight.get_overlapping_bodies().size() > 0:
			gravity = jump_force
			horizontal_force = -bounce_force			
			can_double_jump = true
			print("Jump right")
		elif can_double_jump:
			gravity = jump_force
			can_double_jump = false
			print("Jump double")

	move_and_collide(Vector2(0, gravity_direction * gravity * delta))
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("move_left"):
		is_pressing_left = true
		boost -= 1
		if not Input.is_action_pressed("move_right"):
			is_moving_left = true
	if event.is_action_pressed("move_right"):
		is_pressing_right = true
		boost += 1
		if not Input.is_action_pressed("move_left"):
			is_moving_right = true
	if event.is_action_released("move_left"):
		if is_pressing_left:
			boost += 1
			is_pressing_left = false
		if is_moving_right:
			boost += 1
		if is_moving_left:
			is_moving_left = false
			if is_pressing_right:
				is_moving_right = true		
	if event.is_action_released("move_right"):
		if is_pressing_right:
			boost -= 1
			is_pressing_right = false
		if is_moving_left:
			boost -= 1
		if is_moving_right:
			is_moving_right = false
			if is_pressing_left:
				is_moving_left = true
#	print("Boost: ", boost)
		
func kill():
	emit_signal("died")
	queue_free()
