extends StaticBody2D

signal interacted_with

var _interactable: bool = false

func get_bingo_numbers() -> BingoEntry:
	var color: BingoColor.Type = BingoColor.Type.values().pick_random() as BingoColor.Type
	var rarity := _roll_rarity()
	return BingoEntry.new(color, rarity)


func _roll_rarity() -> int:
	var roll := randi() % 100

	if roll < 40:
		return 0   # COMMON
	elif roll < 60:
		return 1   # UNCOMMON
	elif roll < 93:
		return 2   # RARE
	else:
		return 3   # LEGENDARY


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		_interactable = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		_interactable = false

func _input(event: InputEvent) -> void:
	if not _interactable:
		return
	
	if Input.is_action_just_pressed("interact"):
		interacted_with.emit()
