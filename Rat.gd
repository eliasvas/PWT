extends Area2D
var killed = false
func _ready():
	$AnimatedSprite2D.play("rise")
	await $AnimatedSprite2D.animation_looped
	$AnimatedSprite2D.play("stay")
	await $AnimatedSprite2D.animation_looped
	$AnimatedSprite2D.play_backwards("rise")
	await $AnimatedSprite2D.animation_looped
	$"..".emit_signal("ratNotKilled")
	queue_free()

var mouse_over = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		print("STAB")
		MusicController.play_sound("res://stab.mp3")
	if mouse_over and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		rotate(90)
		killed = true
		$AnimatedSprite2D.stop()
		$"..".emit_signal("ratKilled")
		queue_free()


func _on_mouse_entered():
	mouse_over = true


func _on_mouse_exited():
	mouse_over = false
