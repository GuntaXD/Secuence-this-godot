extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_win():
	visible = true
	$VBoxContainer/Label.text = "You WIN!!! :3"
	pass # Replace with function body.


func _on_timer_ui_lose():
	visible = true
	$VBoxContainer/Label.text = "You LOSE :C"
	
	pass # Replace with function body.
