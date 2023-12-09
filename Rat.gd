extends Area2D

func _ready():
	$RatTex/AnimationPlayer.play("anim")
	await $RatTex/AnimationPlayer.animation_finished
	$"..".emit_signal("ratNotKilled")
	queue_free()

var mouse_over = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if mouse_over and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and $RatTex.offset.y != 0:
		rotate(90)
		$RatTex/AnimationPlayer.stop()
		$"..".emit_signal("ratKilled")
		queue_free()


func _on_mouse_entered():
	mouse_over = true


func _on_mouse_exited():
	mouse_over = false
