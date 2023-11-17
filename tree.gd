extends Node2D

@export var health = 100.0
@export var woodInventory: InventoryItem

@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func isHitted(amount: float) -> bool:
	health -= amount
	
	sprite.self_modulate.a = health / 100
	
	if health <= 0:
		queue_free()
		woodInventory.updateAmount(1)
		return false
	
	return true
