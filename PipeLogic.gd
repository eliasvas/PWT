extends Node2D


# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
func _ready():
	BackgroundImage.load_textures("pipe")
	var sprinklers = ["WaterSprinkler1","WaterSprinkler2","WaterSprinkler3"]
	var first_to_kill = rng.randi() % 3
	var second_to_kill = first_to_kill
	while second_to_kill == first_to_kill:
		second_to_kill = rng.randi() % 3
	#get_node(sprinklers[first_to_kill]).queue_free()
	#get_node(sprinklers[second_to_kill]).queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
