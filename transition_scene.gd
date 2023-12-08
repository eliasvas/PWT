extends CanvasLayer
func change_scene_instant(target : String) -> void:
	get_tree().change_scene_to_file(target)
func change_scene(target : String) -> void:
	layer = 3
	$TransitionSceneRect/AnimationPlayer.play('FadeToBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$TransitionSceneRect/AnimationPlayer.play('FadeFromBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	layer = 1
func fade_n_exit() -> void:
	layer = 3
	$TransitionSceneRect/AnimationPlayer.play('FadeToBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	layer = 1
	get_tree().quit()
