extends Node2D

var sound_direct =preload("res://sound_direct.tscn")

func _ready():
	play_music();


func _process(delta):
	pass
	
func play_music(target : String = "res://mayhem.mp3"):
	print("Play music: " + target)
	var new_music = load(target)
	$AudioStreamPlayer2D.stream = new_music
	$AudioStreamPlayer2D.play()

func play_sound(target : String = "res://mayhem.mp3"):
	var sound = sound_direct.instantiate()
	add_child(sound)
	sound.play_sound(load(target))
