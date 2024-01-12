extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var tm = $TileMap
	var shape = RectangleShape2D.new()
	shape.extents = tm.cell_size * 0.5
	
	# KillArea
	var lava_id = tm.tile_set.find_tile_by_name("lava.png 1")
	for lava in tm.get_used_cells_by_id(lava_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$KillArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(lava.x * tm.cell_size.x, lava.y * tm.cell_size.y)
		pass
		
	# HyperJumpArea
	var jumper_id = tm.tile_set.find_tile_by_name("jumper.png 2")
	for uc in tm.get_used_cells_by_id(jumper_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$HyperJumpArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(uc.x * tm.cell_size.x, uc.y * tm.cell_size.y)
		pass
		
	# ReverseFallArea
	var jump_reverse_id = tm.tile_set.find_tile_by_name("jump_reverse.png 4")
	for uc in tm.get_used_cells_by_id(jump_reverse_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$ReverseFallArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(uc.x * tm.cell_size.x, uc.y * tm.cell_size.y)
		pass
		
	# HyperFallArea
	var hyper_fall_id = tm.tile_set.find_tile_by_name("hyper_fall.png 5")
	for uc in tm.get_used_cells_by_id(hyper_fall_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$HyperFallArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(uc.x * tm.cell_size.x, uc.y * tm.cell_size.y)
		pass
		
	# SpringArea
	var spring_id = tm.tile_set.find_tile_by_name("spring.png 6")
	for uc in tm.get_used_cells_by_id(spring_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$SpringArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(uc.x * tm.cell_size.x, uc.y * tm.cell_size.y)
		pass
		
	# FallArea
	var fall_id = tm.tile_set.find_tile_by_name("fall.png 7")
	for uc in tm.get_used_cells_by_id(fall_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$FallTileArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(uc.x * tm.cell_size.x, uc.y * tm.cell_size.y)
		pass
		
	# ReverseArea
	var reverse_id = tm.tile_set.find_tile_by_name("reverse.png 8")
	for uc in tm.get_used_cells_by_id(reverse_id):
		var cs = CollisionShape2D.new()
		cs.shape = shape
		$ReverseTileArea.add_child(cs)
		cs.global_position = tm.cell_size * 0.5 + Vector2(uc.x * tm.cell_size.x, uc.y * tm.cell_size.y)
		pass
		
		
	_on_Player_died()
#	call_deferred("_on_Player_died")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_died():
	var player = preload("res://Player.tscn").instance()
#	add_child(player)
	call_deferred("add_child", player)
	player.global_position = $ReviveArea.revive_shape.global_position
	player.connect("died",self,"_on_Player_died")
	var camera = Camera2D.new()
	player.add_child(camera)
	camera.current = true
	camera.zoom.x = 2
	camera.zoom.y = 2
	pass # Replace with function body.
