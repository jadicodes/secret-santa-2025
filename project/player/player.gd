extends CharacterBody2D

@onready var _input_component: InputComponent = %InputComponent
@onready var _movement_component: MovementComponent = %MovementCompenent
@onready var _movement_animation_component: MovementAnimationComponent = %MovementAnimationComponent


func _physics_process(delta: float) -> void:
	_input_component.apply_inputs()
	_movement_component.set_input(
		_input_component.dir,
		_input_component.jump_requested
	)
	_movement_component.update(delta)
	_movement_animation_component.update_animation(velocity, is_on_floor())
