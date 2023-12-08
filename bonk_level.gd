extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundImage.load_textures("bonk")
	await get_tree().create_timer(4).timeout
	TransitionScene.change_scene('res://pipe_level.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
