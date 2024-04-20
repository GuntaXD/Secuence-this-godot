extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Easy")
	add_item("Normal")
	add_item("Hard")
	add_item("Very Hard")
	select(GameManager.select - 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_selected(index):
	match index:
		0:
			GameManager.select = GameManager.Difficulty.EASY
		1:
			GameManager.select = GameManager.Difficulty.NORMAL
		2:
			GameManager.select = GameManager.Difficulty.HARD
		3:
			GameManager.select = GameManager.Difficulty.VERY_HARD
	pass # Replace with function body.
