extends TextureRect



var default_texture : Texture = preload("res://pommel_up.png")
var pressed_texture : Texture = preload("res://pommel_down.png")

var cursor = load("res://drag_cursor.png")


func _ready():
	print("setting custom cursor!")
	Input.set_custom_mouse_cursor(cursor)
	
func _on_mouse_entered():
	self.modulate = Color(1.2, 1.2, 1.2, 1.0)

func _on_mouse_exited():
	# Reset appearance on mouse exit
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_handle_button_click()
		texture = pressed_texture
	

func handle_action(action):
	if action == "QuitGame":
		get_tree().quit()

func _handle_button_click():
	print("Button clicked!")
	print("action: " + self.name)
	handle_action(self.name)
	#play flush sound
	#transition scene
	#start game


