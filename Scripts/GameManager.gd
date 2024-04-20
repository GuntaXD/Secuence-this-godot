extends Node

enum Difficulty {EASY = 1 , NORMAL , HARD , VERY_HARD }

enum Modes {STANDART = 1, TIME_TRIAL}

var difficultyNames = ["easy", "normal" , "hard" , "very_hard"]

var select = Difficulty.EASY
var modeSelect = Modes.STANDART

func _ready():
	pass
