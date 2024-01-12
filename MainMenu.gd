extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_level(s):
	var main = preload("res://Main.tscn").instance()
	var revive = main.get_node("ReviveArea")
	var shape = revive.get_node(s)
	revive.revive_shape = shape
	get_tree().root.add_child(main)
	get_tree().current_scene = main
	get_tree().root.remove_child(self)
#	get_tree().change_scene_to(main)
	pass

func _on_Button_pressed():
	change_level("CollisionShape2D5")
	pass # Replace with function body.


func _on_Button2_pressed():
	change_level("CollisionShape2D6")
	pass # Replace with function body.


func _on_Button3_pressed():
	change_level("CollisionShape2D7")
	pass # Replace with function body.


func _on_Button4_pressed():
	change_level("CollisionShape2D8")
	pass # Replace with function body.


func _on_Button5_pressed():
	change_level("CollisionShape2D9")
	pass # Replace with function body.


func _on_Button6_pressed():
	change_level("CollisionShape2D10")
	pass # Replace with function body.


func _on_Button7_pressed():
	change_level("CollisionShape2D11")
	pass # Replace with function body.


func _on_Button8_pressed():
	change_level("CollisionShape2D12")
	pass # Replace with function body.


func _on_Button9_pressed():
	change_level("CollisionShape2D13")
	pass # Replace with function body.
