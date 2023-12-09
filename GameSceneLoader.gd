extends Node2D

@export var count = 0
var prev_index
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var game_scenes = ["res://pipe_level.tscn","res://bonk_level.tscn","res://catchemall.tscn"]

func load_menu():
	count = 0
	TransitionScene.change_scene("res://menu.tscn")

func get_count():
	return count

func load_next_scene():
	var rng = RandomNumberGenerator.new()
	var index = rng.randi() % 3
	if index == prev_index:
		index += 1
		index = index % 3
	prev_index = index
	TransitionScene.change_scene(game_scenes[index])
	#await until change scene completed
	await get_tree().create_timer(0.8).timeout
	count +=1
	
