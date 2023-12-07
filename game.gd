extends Node2D
var menu_scene = preload("res://menu.tscn")


func _ready():
	print("Spawning menu!")
	var object = menu_scene.instantiate()
	call_deferred("add_child",object)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
