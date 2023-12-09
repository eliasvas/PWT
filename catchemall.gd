extends Node2D

var bad_ending = false
# Called when the node enters the scene tree for the first time.
func _ready():
	CustomCursor.load_cursor("mouse", "mousec", 0.8)
	BackgroundImage.load_textures("catchemall")
	var rng = RandomNumberGenerator.new()
	var bad_index = rng.randi() % 3
	for n in range(3):
		if n == bad_index:
			instantiate_droppable_item_bad(n)
		else:
			instantiate_droppable_item_good(n)
	await get_tree().create_timer(4).timeout
	GameSceneLoader.load_menu()



var droppable = preload("res://droppable_item.tscn")
var good_textures = [preload("res://wrench.png"), preload("res://wrench3.png")]
var spawnPoints = [Vector2(400,500), Vector2(600, 450), Vector2(70, 470)]
func instantiate_droppable_item_good(index : int):
	var pos = spawnPoints[index]
	var rng = RandomNumberGenerator.new()
	var droppableItemInstance = droppable.instantiate()
	droppableItemInstance.get_child(0).texture = good_textures[rng.randi() % 2]
	droppableItemInstance.position = pos
	add_child(droppableItemInstance)
	
var bad_texture = preload("res://wrench2.png")
var bad_guy = null
func instantiate_droppable_item_bad(index : int):
	var pos = spawnPoints[index]
	var droppableItemInstance = droppable.instantiate()
	droppableItemInstance.get_child(0).texture = bad_texture
	droppableItemInstance.position = pos
	#droppableItemInstance.texture = pos
	add_child(droppableItemInstance)
	bad_guy = droppableItemInstance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var valid_drops = 0
var DONE = false
func _on_box_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("PRESS")
		else:
			print("RELEASE")
			if object_inside != null:
				object_inside.queue_free()
				if object_inside == bad_guy:
					print("OMG A BAD GUY")
					bad_ending = true
					MusicController.play_sound("res://spill.mp3")
					DONE = true
				else:
					if DONE:return
					valid_drops +=1
					$WrenchPart1.visible = true
					MusicController.play_sound("res://toolbox.mp3")
				if valid_drops == 2:
					$WrenchPart2.visible = true
					await get_tree().create_timer(0.5).timeout
					if !bad_ending:
						GameSceneLoader.load_next_scene()
					

var object_inside

func _on_box_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	object_inside = body
	print("in")


func _on_droppable_item_mouse_shape_exited(shape_idx):
	object_inside = null
