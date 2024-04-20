extends Label

@onready var mins: int = 0
@onready var secs: int = 0

signal lose

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if ( GameManager.modeSelect == GameManager.Modes.TIME_TRIAL ):
		match GameManager.select:
			GameManager.Difficulty.EASY:
				mins = 1
				secs = 15
			GameManager.Difficulty.NORMAL:
				mins = 2
				secs = 15
			GameManager.Difficulty.HARD:
				mins = 3
				secs = 30
			GameManager.Difficulty.VERY_HARD:
				mins = 4
				secs = 45
	
	show_clock()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func timer():
	if( secs == 0 ):
		mins -= 1
		secs = 60
	secs -= 1
	
	if mins == 0 && secs == 0:
		emit_signal("lose")
	show_clock()
	pass


func clock():
	secs += 1
	if( secs == 60 ):
		mins += 1
		secs = 0
	
	show_clock()
	pass


func show_clock():
	var clockString
	
	if( mins < 10 ):
		clockString = "0"
	clockString +=  str(mins) + ":"
	
	if( secs < 10 ):
		clockString += "0"
	clockString +=  str(secs)
	
	text = clockString

func _on_timer_timeout():
	match GameManager.modeSelect:
		GameManager.Modes.STANDART:
			clock()
		GameManager.Modes.TIME_TRIAL:
			timer()
	pass # Replace with function body.
