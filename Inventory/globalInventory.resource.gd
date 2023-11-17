extends Resource

class_name GlobalInventory

@export var slots: Array[InventoryItem] = []

func update(name: String):
	var slot = slots.filter(func (s): return s.name == name)
	
	if slot.is_empty():
		var newItem = InventoryItem.new()
		newItem.name = name
		newItem.amount = 1
		slots.append(newItem)
	else:
		var item = slots[0]
		item.amount += 1
		
