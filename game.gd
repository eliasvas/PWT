extends Node2D

var curs = preload("res://drag_cursor.png")

func _ready():
	CustomCursor.load_cursor("cursor_idle", "cursor_pressed")
	TransitionScene.change_scene_instant('res://menu.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_0):
		print("loading up menu.tscn")
		TransitionScene.change_scene_instant('res://menu.tscn')
