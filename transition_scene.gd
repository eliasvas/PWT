extends CanvasLayer

var PROCESSING_REQUEST = false

func change_scene_instant(target : String) -> void:
	if !PROCESSING_REQUEST:PROCESSING_REQUEST=true
	else: return
	get_tree().change_scene_to_file(target)
	PROCESSING_REQUEST=false
func change_scene(target : String) -> void:
	if !PROCESSING_REQUEST:PROCESSING_REQUEST=true
	else: return
	layer = 3
	$TransitionSceneRect/AnimationPlayer.play('FadeToBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$TransitionSceneRect/AnimationPlayer.play('FadeFromBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	layer = 1
	PROCESSING_REQUEST=false
func fade_n_exit() -> void:
	if !PROCESSING_REQUEST:PROCESSING_REQUEST=true
	else: return
	layer = 3
	$TransitionSceneRect/AnimationPlayer.play('FadeToBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	layer = 1
	get_tree().quit()
	PROCESSING_REQUEST=false
