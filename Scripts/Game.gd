extends Node2D

@onready var want_to_change: int = -1
@onready var target_to_change: int = -1
@onready var difficulty = ["Easy","Normal","Hard","Very_Hard"]
@onready var grid_container #get_node("TemplateContainer/" + difficulty[GameManager.select - 1] + "TempleteGrid/GridContainer")
@onready var template
@onready var positions = []

signal win

func _ready():
	print(GameManager.select * 8)
	template = load("res://Scenes/" + difficulty[GameManager.select - 1].to_lower() + "_templete_grid.tscn").instantiate()
	$TemplateContainer.add_child(template)
	grid_container = get_node("TemplateContainer/" + difficulty[GameManager.select - 1] + "TempleteGrid/GridContainer")
	
	var buttons = get_buttons()
	
	positions_setup()
	
	hits_label(verify_positions())
	
	for i in buttons.size():
		var button = buttons[i].get_child(1)
		button.pressed.connect(on_pressed.bind(button))
	
	print(buttons)
	pass # Replace with function body.


func _process(delta):
	pass

func on_pressed(button):
	var button_number = int(button.name.get_slice("TouchScreenButton",1))
	print("name:" + str(button_number))
	print("parent name:" + button.get_parent().name)
	if want_to_change == -1:
		want_to_change = button_number
	elif target_to_change == -1:
		target_to_change = button_number
		order()
		want_to_change = -1
		target_to_change = -1
		hits_label(verify_positions())
		if( verify_positions() == GameManager.select * 8 ):
			emit_signal("win")
			disable_buttons()
		print(positions)

func order():
	var buttons = get_buttons()
	var new_buttons = []
	new_buttons.resize(GameManager.select * 8)
	
	var button_want_to_change = find_button(buttons, want_to_change)
	var button_target_to_change = find_button(buttons, target_to_change)
	
	for i in buttons.size():
		if button_want_to_change == buttons[i]:
			new_buttons[i] = button_target_to_change
		elif button_target_to_change == buttons[i]:
			new_buttons[i] = button_want_to_change
		else:
			new_buttons[i] = buttons[i]
	
	print(str(want_to_change) + "-" + str(target_to_change))
	print(new_buttons)
	change(buttons, new_buttons)
	print(get_buttons())

func change(buttons , new_buttons):
	
	for i in range(GameManager.select * 8):
		grid_container.remove_child(buttons[i])
	
	for i in range(GameManager.select * 8):
		grid_container.add_child(new_buttons[i])
	
	pass

func get_buttons() -> Array:
	return grid_container.get_children()

func find_button(buttons , number ):
	for i in buttons.size():
		if number == int(buttons[i].get_child(1).name.get_slice("TouchScreenButton",1)):
			return buttons[i]
	return null

func verify_positions() -> int:
	var buttons = get_buttons()
	var hits: int = 0
	for i in buttons.size():
		if int(buttons[i].name.get_slice("Button",1)) == positions[i]:
			hits = hits + 1
	return hits

func hits_label(number)-> void:
	$HBoxContainer/Hits.text = "HITS: " + str(number)

func positions_setup()-> void:
	positions.resize(GameManager.select * 8)
	for i in positions.size():
		positions[i] = i + 1
	positions.shuffle()


func _on_final_screen_exit_button_pressed():
	AudioStreams.btn_click()
	get_tree().quit()
	pass # Replace with function body.


func _on_final_screen_retry_button_pressed():
	AudioStreams.btn_click()
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_back_btn_pressed():
	AudioStreams.btn_click()
	var new_scene = ResourceLoader.load("res://Scenes/start_ui.tscn")
	get_tree().change_scene_to_packed(new_scene)
	pass # Replace with function body.

func disable_buttons():
	var buttons = get_buttons()
	for i in buttons.size():
		buttons[i].get_child(1).visible = false


func _on_timer_ui_lose():
	disable_buttons()
	pass # Replace with function body.
