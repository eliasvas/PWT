extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("light_sprinkle")

var time_fixing = 0.0;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (level_ended):return
	_get_mouse_state()
	if (time_fixing > 0.5):
		print("fixed!!")
		$AnimatedSprite2D.play("fixed")
		level_ended = true
	if mouse_state == MOUSE_DOWN && collider_state == INSIDE_COLLIDER:
		#print("inside!!!")
		time_fixing+=delta
	if prev_mouse_state == MOUSE_UP && mouse_state == MOUSE_DOWN && collider_state == INSIDE_COLLIDER:
		$AnimatedSprite2D.play("default")
	if collider_state == OUTSIDE_COLLIDER:
		$AnimatedSprite2D.play("light_sprinkle")
	

enum {MOUSE_UP, MOUSE_DOWN}
enum {INSIDE_COLLIDER, OUTSIDE_COLLIDER}
var prev_mouse_state = MOUSE_UP
var mouse_state = MOUSE_UP
var collider_state = OUTSIDE_COLLIDER
var level_ended = false

func _get_mouse_state():
	prev_mouse_state = mouse_state
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouse_state = MOUSE_DOWN
	else:
		mouse_state = MOUSE_UP

func _on_mouse_entered():
	collider_state = INSIDE_COLLIDER
func _on_mouse_exited():
	collider_state = OUTSIDE_COLLIDER


func _on_timer_timeout():
	print("sprinkler timer timeout!")
	if !level_ended:
		level_ended = true
		$AnimatedSprite2D.play("heavy_sprinkle")
		await $AnimatedSprite2D.animation_looped
		print("Back to title!")
		TransitionScene.change_scene('res://menu.tscn')
	else:
		$AnimatedSprite2D.play("fixed")
		await $AnimatedSprite2D.animation_looped
		TransitionScene.change_scene('res://pipe_level.tscn')
