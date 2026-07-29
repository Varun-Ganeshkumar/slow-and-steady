extends StaticBody2D


@onready var interactable: Area2D = $Interactable

func _ready() -> void:
	interactable.interact = _on_interact
	if global.woodForBuilding == 1:
		self.queue_free()
	else:
		self.visible = true
	
func _on_interact():
	if global.woodForBuilding == 0:
		interactable.is_interactable = false
		global.woodForBuilding += 1
		self.visible = false
