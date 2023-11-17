extends HBoxContainer

@export var globalInventory: GlobalInventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var item = globalInventory.slots.front()
	
	if not item == null:
		var treeItem = get_children()[0]
		var label: Label = treeItem.get_child(0)
		
		label.text = str(item.amount)
