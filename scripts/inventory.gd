extends CanvasLayer

@onready var grid = $GridContainer # or wherever your slots are

func update_inventory(items):
	# clear old UI
	for child in grid.get_children():
		child.queue_free()
	
	# add items
	for item in items:
		var texture_rect = TextureRect.new()
		texture_rect.texture = item["icon"]
		texture_rect.custom_minimum_size = Vector2(64, 64)
		grid.add_child(texture_rect)
