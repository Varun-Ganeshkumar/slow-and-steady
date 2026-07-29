extends StaticBody2D


@onready var interactable: Area2D = $Interactable

func _ready() -> void:
	interactable.interact = _on_interact
	if global.freezeItem == 1:
		self.queue_free()
	else:
		self.visible = true
	
func _on_interact():
	if global.freezeItem == 0 and global.survivalPoints >= 3:
		interactable.is_interactable = false
		global.freezeItem += 1
		self.visible = false
		global.survivalPoints -= 3
