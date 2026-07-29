extends AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if global.failure == true:
		if get_tree().current_scene.scene_file_path != "res://scenes/city_one.tscn":
			get_tree().change_scene_to_file("res://scenes/city_one.tscn")
		elif get_tree().current_scene.scene_file_path == "res://scenes/city_one.tscn" and global.JUSTONCE:
			get_tree().reload_current_scene()
			global.JUSTONCE = false
		self.play("someohting")		
		
