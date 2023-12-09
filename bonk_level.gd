extends Node2D

signal ratKilled
signal ratNotKilled

# Called when the node enters the scene tree for the first time.
func _ready():
	CustomCursor.load_cursor_single("screwdriver.png","screwdriver_stab.png", 1.8)
	BackgroundImage.load_textures("bonk")
	await get_tree().create_timer(2).timeout
	GameSceneLoader.load_next_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var not_killed_counter = 3
func _on_rat_not_killed():
	not_killed_counter -= 1
	if not_killed_counter == 0:
		await get_tree().create_timer(1).timeout
		GameSceneLoader.load_menu()
		


func _on_rat_killed():
	await get_tree().create_timer(1).timeout
	GameSceneLoader.load_next_scene()
