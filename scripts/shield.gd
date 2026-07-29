extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
var spriteModulate = 50

func _ready() -> void:
	interactable.interact = _on_interact
	if global.cityOneBuilt and get_tree().current_scene.scene_file_path == "res://scenes/city_one.tscn":
		sprite_2d.self_modulate.a = 255
		interactable.is_interactable = false
	elif global.cityTwoBuilt and get_tree().current_scene.scene_file_path == "res://scenes/city_two.tscn":
		sprite_2d.self_modulate.a = 255
		interactable.is_interactable = false
	elif global.cityThreeBuilt and get_tree().current_scene.scene_file_path == "res://scenes/city_three.tscn":
		sprite_2d.self_modulate.a = 255
		interactable.is_interactable = false
	elif global.cityFourBuilt and get_tree().current_scene.scene_file_path == "res://scenes/city_four.tscn":
		sprite_2d.self_modulate.a = 255
		interactable.is_interactable = false
	
func _on_interact():
	if spriteModulate < 255 and global.woodForBuilding != 0:
		interactable.is_interactable = false
		spriteModulate = 255
		if get_tree().current_scene.scene_file_path == "res://scenes/city_one.tscn":
			global.cityOneBuilt = true
		elif get_tree().current_scene.scene_file_path == "res://scenes/city_two.tscn":
			global.cityTwoBuilt = true
		elif get_tree().current_scene.scene_file_path == "res://scenes/city_three.tscn":
			global.cityThreeBuilt = true
		elif get_tree().current_scene.scene_file_path == "res://scenes/city_four.tscn":
			global.cityFourBuilt = true
		sprite_2d.self_modulate.a = spriteModulate
		global.survivalPoints += 1
		global.woodForBuilding -= 1
