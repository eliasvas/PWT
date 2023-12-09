extends Node2D

signal spinklerSuccess
signal spinklerFail

# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
func _ready():
	CustomCursor.load_cursor("tool", "toolc", 1)
	BackgroundImage.load_textures("pipe")
	var sprinklers = ["WaterSprinkler1","WaterSprinkler2","WaterSprinkler3"]
	var first_to_kill = rng.randi() % 3
	var second_to_kill = first_to_kill
	while second_to_kill == first_to_kill:
		second_to_kill = rng.randi() % 3
	get_node(sprinklers[first_to_kill]).queue_free()
	get_node(sprinklers[second_to_kill]).queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var successes_needed = 2
func _on_spinkler_success():
	successes_needed -= 1
	if successes_needed == 0:
		await get_tree().create_timer(0.5).timeout
		successes_needed = 99
		GameSceneLoader.load_next_scene()


func _on_spinkler_fail():
	await get_tree().create_timer(2).timeout
	GameSceneLoader.load_menu()
