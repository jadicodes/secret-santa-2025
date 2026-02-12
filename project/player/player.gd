extends CharacterBody2D

@onready var _input_component: InputComponent = %InputComponent
@onready var _movement_compenent: MovementCompenent = %MovementCompenent
@onready var _movement_animation_component: MovementAnimationComponent = %MovementAnimationComponent


func _physics_process(_delta: float) -> void:
	_input_component.apply_inputs()
	_movement_compenent.set_dir(_input_component.dir)
	_movement_compenent.update()
	_movement_animation_component.update_animation(velocity)
