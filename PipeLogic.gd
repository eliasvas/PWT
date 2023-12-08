extends Node2D


# Called when the node enters the scene tree for the first time.
var rng = RandomNumberGenerator.new()
func _ready():
	var sprinklers = ["WaterSprinkler1","WaterSprinkler2","WaterSprinkler3"]
	get_node(sprinklers[rng.randi() % 3]).queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
