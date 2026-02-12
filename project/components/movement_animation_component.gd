class_name MovementAnimationComponent
extends Node

@onready var _animated_sprite: AnimatedSprite2D = %AnimatedSprite2D


func update_animation(velocity: Vector2) -> void:
	if velocity.length() == 0:
		_animated_sprite.play("idle")
		return
	
	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			_animated_sprite.play("walk_right")
		else:
			_animated_sprite.play("walk_left")
	else:
		if velocity.y > 0:
			_animated_sprite.play("walk_down")
		else:
			_animated_sprite.play("walk_up")
