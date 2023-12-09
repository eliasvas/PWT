extends Node2D

signal ratKilled
signal ratNotKilled

var rat = preload("res://rat.tscn")
var spawnPoints = [Vector2(160,200),Vector2(320,310),Vector2(590,490)]
var level_ended = false
func instantiate_rat():
	if level_ended:return;
	var rng = RandomNumberGenerator.new()
	var pos = spawnPoints[rng.randi() % 3]
	var ratInstance = rat.instantiate()
	ratInstance.position = pos
	add_child(ratInstance)

# Called when the node enters the scene tree for the first time.
func _ready():
	CustomCursor.load_cursor_single("screwdriver.png","screwdriver_stab.png", 1.8)
	BackgroundImage.load_textures("bonk")
	await get_tree().create_timer(0.5).timeout
	instantiate_rat()
	await get_tree().create_timer(4).timeout
	GameSceneLoader.load_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var not_killed_counter = 3
func _on_rat_not_killed():
	instantiate_rat()
		


func _on_rat_killed():
	level_ended = true
	await get_tree().create_timer(1).timeout
	GameSceneLoader.load_next_scene()
