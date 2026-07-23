extends Control

@onready var city_one_countdown: Label = $"CanvasLayer/City One Countdown"
@onready var city_two_countdown: Label = $"CanvasLayer/City Two Countdown"
@onready var city_three_countdown: Label = $"CanvasLayer/City Three Countdown"
@onready var city_four_countdown: Label = $"CanvasLayer/City Four Countdown"
@onready var count_down_timer: Timer = $CanvasLayer/CountDownTimer


func _ready() -> void:
	count_down_timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	city_one_countdown.text = "City One: " + str(global.cityOneTimer) + " Seconds Left"
	city_two_countdown.text = "City Two: " + str(global.cityTwoTimer) + " Seconds Left"
	city_three_countdown.text = "City Three: " + str(global.cityThreeTimer) + " Seconds Left"
	city_four_countdown.text = "City Four: " + str(global.cityFourTimer) + " Seconds Left"
	

func _on_count_down_timer_timeout() -> void:
	global.cityOneTimer -= 1
	global.cityTwoTimer -= 1
	global.cityThreeTimer -= 1
	global.cityFourTimer -= 1
	count_down_timer.start()
