class_name Key
extends StaticBody2D

signal collected

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		collected.emit()
		queue_free()
