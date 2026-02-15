class_name InputComponent
extends Node

var dir: float = 0.0
var jump_requested: bool = false


func apply_inputs() -> void:
	dir = Input.get_axis("left", "right")
	
	jump_requested = Input.is_action_just_pressed("jump")
