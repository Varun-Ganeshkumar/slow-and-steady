extends CanvasLayer

var is_paused:bool = false
@onready var city_one_button: Button = $CityOneButton
@onready var city_two_button: Button = $CityTwoButton
@onready var city_three_button: Button = $CityThreeButton
@onready var city_four_button: Button = $CityFourButton
	
func set_paused(value:bool) -> void:
	is_paused = value
	self.visible = is_paused
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if is_paused else Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('open_menu'):
		is_paused = !is_paused
		get_tree().paused = is_paused
		
func _process(_delta: float) -> void:
	set_paused(is_paused)
	

func _on_city_one_button_pressed() -> void:
	is_paused = false
	get_tree().paused = is_paused
	get_tree().change_scene_to_file("res://scenes/city_one.tscn")
	print(is_paused)
	
func _on_city_two_button_pressed() -> void:
	is_paused = false
	get_tree().paused = is_paused
	get_tree().change_scene_to_file("res://scenes/city_two.tscn")

func _on_city_three_button_pressed() -> void:
	is_paused = false
	get_tree().paused = is_paused
	get_tree().change_scene_to_file("res://scenes/city_three.tscn")

func _on_city_four_button_pressed() -> void:
	is_paused = false
	get_tree().paused = is_paused
	get_tree().change_scene_to_file("res://scenes/city_four.tscn")

func _on_shop_button_pressed() -> void:
	is_paused = false
	get_tree().paused = is_paused
	get_tree().change_scene_to_file("res://scenes/shop.tscn")
