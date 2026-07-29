extends Control

@onready var city_one_countdown: Label = $"CanvasLayer/City One Countdown"
@onready var city_two_countdown: Label = $"CanvasLayer/City Two Countdown"
@onready var city_three_countdown: Label = $"CanvasLayer/City Three Countdown"
@onready var city_four_countdown: Label = $"CanvasLayer/City Four Countdown"
@onready var count_down_timer: Timer = $CanvasLayer/CountDownTimer
@onready var label: Label = $Label

# THIS IS ALSO THE SCRIPT WHERE THE COUNTDOWNS ARE FOR SOME REASON
func _ready() -> void:
	count_down_timer.start()
	if get_tree().current_scene.scene_file_path == "res://scenes/shop.tscn":
		if global.survivalPoints == 1:
			label.text = "You currently have 1 Survival Point."
		else:
			label.text = "You currently have " + str(global.survivalPoints) + " Survival Points."
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	city_one_countdown.text = "City One: " + str(global.cityOneTimer) + " Seconds Left"
	city_two_countdown.text = "City Two: " + str(global.cityTwoTimer) + " Seconds Left"
	city_three_countdown.text = "City Three: " + str(global.cityThreeTimer) + " Seconds Left"
	city_four_countdown.text = "City Four: " + str(global.cityFourTimer) + " Seconds Left"
	
	if Input.is_action_just_pressed("freeze") and global.freezeItem > 0:
		global.freezeItem -= 1
		if get_tree().current_scene.scene_file_path == "res://scenes/city_one.tscn":
			global.cityOnePause = 10
		if get_tree().current_scene.scene_file_path == "res://scenes/city_two.tscn":
			global.cityTwoPause = 10
		if get_tree().current_scene.scene_file_path == "res://scenes/city_three.tscn":
			global.cityThreePause = 10
		if get_tree().current_scene.scene_file_path == "res://scenes/city_four.tscn":
			global.cityFourPause = 10
			
	if global.cityOneTimer == 0 and global.cityOneBuilt:
		global.cityOneBuilt = false
		global.fullCompletions += 1
		global.cityOneTimer = floor(((50 * (global.fullCompletions/4)) / -5) + 40)
	elif global.cityOneTimer == 0 and !global.cityOneBuilt:
		global.failure = true	
		
	if global.cityTwoTimer == 0 and global.cityTwoBuilt:
		global.cityTwoBuilt = false
		global.fullCompletions += 1
		global.cityTwoTimer = floor(((50 * (global.fullCompletions/4)) / -5) + 40)
	elif global.cityTwoTimer == 0 and !global.cityTwoBuilt:
		global.failure = true
		
	if global.cityThreeTimer == 0 and global.cityThreeBuilt:
		global.cityThreeBuilt = false
		global.fullCompletions += 1
		global.cityThreeTimer = floor(((50 * (global.fullCompletions/4)) / -5) + 40)
	elif global.cityThreeTimer == 0 and !global.cityThreeBuilt:
		global.failure = true
		
	if global.cityFourTimer == 0 and global.cityFourBuilt:
		global.cityFourBuilt = false
		global.fullCompletions += 1
		global.cityFourTimer = floor(((50 * (global.fullCompletions/4)) / -5) + 40)
	elif global.cityFourTimer == 0 and !global.cityFourBuilt:
		global.failure = true
	
	if global.failure == true:
		count_down_timer.stop()
		self.queue_free()
	

func _on_count_down_timer_timeout() -> void:
	if global.cityOnePause < 0:
		global.cityOneTimer -= 1
	if global.cityTwoPause < 0:
		global.cityTwoTimer -= 1
	if global.cityThreePause < 0:
		global.cityThreeTimer -= 1
	if global.cityFourPause < 0:
		global.cityFourTimer -= 1
	global.cityOnePause -= 1
	global.cityTwoPause -= 1
	global.cityThreePause -= 1
	global.cityFourPause -= 1
	count_down_timer.start()
