extends StaticBody2D

signal interacted_with

var _interactable := false


func _ready():
	$Sprite2D.play("default")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		_interactable = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		_interactable = false


func _input(_event: InputEvent) -> void:
	if not _interactable:
		return
	
	if Input.is_action_just_pressed("interact"):
		interacted_with.emit()
