class_name MovementComponent
extends Node

@export var _body: CharacterBody2D
@export var speed := 512.0
@export var gravity := 1200.0
@export var jump_force := 500.0

var _dir: float = 0.0
var _jump_requested: bool = false


func set_input(direction: float, jump: bool) -> void:
	_dir = direction
	_jump_requested = jump


func update(delta: float) -> void:
	if not _body.is_on_floor():
		_body.velocity.y += gravity * delta
	else:
		if _body.velocity.y > 0:
			_body.velocity.y = 0

	_body.velocity.x = _dir * speed

	if _jump_requested and _body.is_on_floor():
		_body.velocity.y = -jump_force

	_body.move_and_slide()
