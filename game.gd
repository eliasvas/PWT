extends Node2D

var curs = preload("res://drag_cursor.png")

func _ready():
	CustomCursor.load_cursor("res://pommel_down.png", "res://pommel_up.png")
	TransitionScene.change_scene_instant('res://menu.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
