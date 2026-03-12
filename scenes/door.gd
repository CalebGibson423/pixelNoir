extends Area2D

var Player_Is_In:bool

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player_Is_In = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Player_Is_In = false
		print(Player_Is_In)
