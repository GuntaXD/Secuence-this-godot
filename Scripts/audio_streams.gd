extends Node

var sounds = ["res://Assets/sound1.wav","res://Assets/sound2.wav","res://Assets/sound3.wav","res://Assets/sound4.wav"]

func btn_click() -> void:
	var audio = load(sounds.pick_random())
	$SFX.stream = audio
	$SFX.play()
