extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	CustomCursor.load_cursor("tool", "toolc", 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotating_state:
		rotation += 1
	$Sprite2D.rotate(rotationn * delta)

var MOUSE_IN = false
var rotationn = 0
func _on_area_2d_mouse_entered():
	self.modulate = Color(1.2, 1.2, 1.2, 1.0)
	print("mouse entered!")
	MOUSE_IN = true


func _on_area_2d_mouse_exited():
	print("mouse exited!")
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)
	MOUSE_IN = false

var action_done = false
func handle_action(action):
	if action_done:return
	MusicController.play_sound("res://flush.mp3")
	if action == "QuitGame":
		TransitionScene.fade_n_exit()
		action_done = true
	elif action == "ShowOptions":
		GameSceneLoader.load_menu()
		action_done = true
	elif action == "StartGame":
		GameSceneLoader.load_next_scene()
		action_done = true

var rotating_state = false
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("lmb") && MOUSE_IN:
		rotating_state = true
		handle_action(name)
		
