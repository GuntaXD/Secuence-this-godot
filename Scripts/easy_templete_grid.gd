extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("do_setup")
	pass # Replace with function body.

func do_setup():
	var buttons = $GridContainer.get_children()
	for i in buttons.size():
		var button = buttons[i].get_child(1)
		var shape = RectangleShape2D.new()
		shape.set_size(buttons[i].size)
		button.set_shape(shape)
		button.position.x = buttons[i].size.x / 2
		button.position.y = buttons[i].size.y / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_touch_screen_button_pressed():
	AudioStreams.btn_click()
	pass # Replace with function body.
