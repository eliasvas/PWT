extends Area2D

# Called when the node enters the scene tree for the first time.
#var max_particles
func _ready():
	pass
	#max_particles = $CPUParticles2D.amount
	#$AnimatedSprite2D.play("light_sprinkle")

var time_fixing = 0.0;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (level_ended):return
	_get_mouse_state()
	if (time_fixing > 0.5):
		$nut.visible = false
		print("fixed!!")
		level_ended = true
		$CPUParticles2D.visible = false
	if mouse_state == MOUSE_DOWN && collider_state == INSIDE_COLLIDER:
		$nut.visible = true
		$nut.rotate(delta * 40)
		time_fixing+=delta
	if prev_mouse_state == MOUSE_UP && mouse_state == MOUSE_DOWN && collider_state == INSIDE_COLLIDER:
		print("just pressed!")
		#$AnimatedSprite2D.play("default")
	#if collider_state == OUTSIDE_COLLIDER:
		#$AnimatedSprite2D.play("light_sprinkle")
	

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
	$nut.visible = false
	collider_state = OUTSIDE_COLLIDER


func _on_timer_timeout():
	$nut.visible = false
	print("sprinkler timer timeout!")
	if !level_ended:
		level_ended = true
		print("Back to title!")
		#send correct signals
		$CPUParticles2D.amount *= 50.0
		#await get_tree().create_timer(2).timeout
		#TransitionScene.change_scene('res://menu.tscn')
		
		var parent = get_parent()
		parent.emit_signal("spinklerFail")
	else:
		var parent = get_parent()
		parent.emit_signal("spinklerSuccess")
