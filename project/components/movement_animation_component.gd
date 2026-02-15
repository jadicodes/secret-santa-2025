class_name MovementAnimationComponent
extends Node

var _facing_right := true
@onready var _animated_sprite: AnimatedSprite2D = %AnimatedSprite2D


func update_animation(velocity: Vector2, is_on_floor: bool) -> void:
	if velocity.x > 0:
		_facing_right = true
	elif velocity.x < 0:
		_facing_right = false

	if not is_on_floor:
		if _facing_right:
			_animated_sprite.play("jump_right")
		else:
			_animated_sprite.play("jump_left")
	
	if abs(velocity.x) < 1:
		_animated_sprite.play("idle")
	else:
		if _facing_right:
			_animated_sprite.play("walk_right")
		else:
			_animated_sprite.play("walk_left")
