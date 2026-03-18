extends Area2D

@export var item_name: String = "Bottle"
@export var item_icon: Texture2D

var player_in_range = false

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"): # E key
		pickup()

func pickup():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.add_item({
			"name": item_name,
			"icon": item_icon
		})
	queue_free() # removes item from world
