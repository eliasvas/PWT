extends Node2D

@export var offsetX = 10
@export var offsetY = 10
@export var scaleX = 0.1
@export var scaleY = 0.1
var clicked_image_m
var idle_image_m
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func load_cursor(idle_image : String, clicked_image : String):
	clicked_image_m = load(clicked_image)
	idle_image_m = load(idle_image)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Sprite2D.position = get_viewport().get_mouse_position()
	$CanvasLayer/Sprite2D.scale = Vector2(scaleX, scaleY)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$CanvasLayer/Sprite2D.texture = clicked_image_m
	else:
		$CanvasLayer/Sprite2D.texture = idle_image_m
		

