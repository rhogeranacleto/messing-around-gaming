extends HBoxContainer

@export var inventoryWoodItem: InventoryItem
@onready var sprite = $Sprite2D
@onready var label = $Label

func _ready():
	sprite.texture = inventoryWoodItem.texture
	inventoryWoodItem.updated.connect(updateLabelAmount)

func updateLabelAmount(amount: int):
	label.text = str(amount)
	visible = true
