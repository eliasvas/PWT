extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	CustomCursor.load_cursor("mouse", "mousec", 0.8)
	BackgroundImage.load_textures("title")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
