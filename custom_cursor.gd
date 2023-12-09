extends Node2D

@export var offsetX = 10
@export var offsetY = 10
@export var TexScale = 1.0

var texidle = [null, null]
var texpress = [null, null]
var INDEX

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	INDEX = 0;
func load_cursor(idle_image_prefix : String, clicked_image_prefix : String, tex_scale : float = 1.0):
	TexScale = tex_scale
	texpress[0] = load("res://"+clicked_image_prefix + "0.png") 
	texpress[1] = load("res://"+clicked_image_prefix + "1.png") 
	texidle[0] = load("res://"+idle_image_prefix + "0.png") 
	texidle[1] = load("res://"+idle_image_prefix + "1.png") 
	
func _process(delta):
	INDEX += delta
	$CanvasLayer/Sprite2D.position = get_viewport().get_mouse_position()
	$CanvasLayer/Sprite2D.scale = Vector2(TexScale, TexScale)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$CanvasLayer/Sprite2D.texture = texpress[int(INDEX * 2) % 2]
	else:
		$CanvasLayer/Sprite2D.texture = texidle[int(INDEX * 2) % 2]

