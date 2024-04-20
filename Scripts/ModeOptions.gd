extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Standar")
	add_item("Time trial")
	select(GameManager.modeSelect - 1)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_selected(index):
	match index:
		0:
			GameManager.modeSelect = GameManager.Modes.STANDART
		1:
			GameManager.modeSelect = GameManager.Modes.TIME_TRIAL
	pass # Replace with function body.
