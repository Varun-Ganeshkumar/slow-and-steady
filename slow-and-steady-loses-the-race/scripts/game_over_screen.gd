extends CanvasLayer

@onready var label: Label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "Game Over. You got " + str(global.fullCompletions * 100) + " points though. That's pretty cool."


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	global.fullCompletions = 0 
	global.failure = false
	global.survivalPoints = 0 
	global.cityOneTimer = 20
	global.cityTwoTimer = 40
	global.cityThreeTimer = 60
	global.cityFourTimer = 80
	global.woodForBuilding = 0
	global.freezeItem = 0
