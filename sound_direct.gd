extends AudioStreamPlayer

var offset = 0

func remove_self():
		queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_sound(sound_stream):
	set_stream(sound_stream)
	#connect("finished",self,"remove_self")
	play(offset)
	await get_tree().create_timer(5).timeout
	remove_self()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
