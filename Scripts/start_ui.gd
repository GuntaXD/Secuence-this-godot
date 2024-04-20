extends Control

var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")
var SFX_BUS_ID = AudioServer.get_bus_index("SFX")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_btn_pressed():
	var new_scene = ResourceLoader.load("res://Scenes/game.tscn")
	sounds_play()
	
	get_tree().change_scene_to_packed(new_scene)
	pass # Replace with function body.


func _on_config_button_pressed():
	sounds_play()
	$ConfigWindow.visible = true
	pass # Replace with function body.


func _on_back_config_btn_pressed():
	sounds_play()
	$ConfigWindow.visible = false
	
	pass # Replace with function body.

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MUSIC_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < 0.05)
	pass # Replace with function body.


func _on_sound_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < 0.05)
	pass # Replace with function body.


func sounds_play():
	AudioStreams.btn_click()
	pass

func _on_mode_options_pressed():
	sounds_play()
	pass # Replace with function body.


func _on_difficulty_options_pressed():
	sounds_play()
	pass # Replace with function body.


func _on_difficulty_options_item_selected(index):
	sounds_play()
	pass # Replace with function body.


func _on_mode_options_item_selected(index):
	sounds_play()
	pass # Replace with function body.


func _on_exit_config_btn_pressed():
	get_tree().quit()
	pass # Replace with function body.
