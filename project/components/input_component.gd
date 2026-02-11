class_name InputComponent
extends Node

var dir: Vector2


func apply_inputs() -> void:
	dir = Input.get_vector("left", "right", "up", "down")
