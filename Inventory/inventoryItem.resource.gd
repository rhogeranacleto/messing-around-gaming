extends Resource

class_name InventoryItem

signal updated(amount: int)

@export var name: String = ""
@export var texture: Texture2D
@export var amount: int

func updateAmount(changes: int):
	amount = amount + changes
	updated.emit(amount)
