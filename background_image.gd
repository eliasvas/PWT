extends Node2D

@export var tweenDelta = 0.5

@export var tex = [null, null]
func load_textures(tex_prefix : String):
	tex[0] = load("res://"+ tex_prefix + "0.png") 
	tex[1] = load("res://"+ tex_prefix + "1.png") 
	$Sprite.texture = tex[0]
	calcImage()


func _ready():
	tex[0] = load("res://pipe0.png")
	tex[1] = load("res://pipe1.png")
	calcImage()

func calcImage():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y

	var scaleX = viewportWidth / $Sprite.texture.get_size().x
	var scaleY = viewportHeight / $Sprite.texture.get_size().y
	$Sprite.set_position(Vector2(viewportWidth/2, viewportHeight/2))
	$Sprite.set_scale(Vector2(scaleX, scaleY))

func _process(delta):
	var seconds = Time.get_ticks_msec() / 1000.0
	#here we should change based on tex0 and tex1 and speed of change
	$Sprite.texture = tex[int(seconds / tweenDelta) % 2]
	pass
