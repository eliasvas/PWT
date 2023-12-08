extends CanvasLayer
func change_scene_instant(target : String) -> void:
	get_tree().change_scene_to_file(target)
func change_scene(target : String) -> void:
	$TransitionSceneRect/AnimationPlayer.play('FadeToBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$TransitionSceneRect/AnimationPlayer.play('FadeFromBlack')

func fade_n_exit() -> void:
	$TransitionSceneRect/AnimationPlayer.play('FadeToBlack')
	await $TransitionSceneRect/AnimationPlayer.animation_finished
	get_tree().quit()
