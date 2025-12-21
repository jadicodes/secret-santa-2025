extends StaticBody2D

signal interacted_with

var _interactable: bool = false

# Index = rarity ID
# 0 = COMMON, 1 = UNCOMMON, 2 = RARE, 3 = LEGENDARY
var rarity_weights := [50, 30, 13, 7]
var color_weights := [25, 25, 25, 25]

func get_bingo_numbers() -> BingoEntry:
	var color := _roll_color()
	var rarity := _roll_rarity()
	return BingoEntry.new(color, rarity)
	
	
func _roll_rarity() -> int:
	print(rarity_weights)
	var total_weight := 0
	for w in rarity_weights:
		total_weight += w

	var roll := randi() % total_weight
	var running := 0

	for i in range(rarity_weights.size()):
		running += rarity_weights[i]
		if roll < running:
			return i

	return 0

func _roll_color() -> int:
	print("Color weights: " + str(color_weights))
	var total_weight := 0
	for w in color_weights:
		total_weight += w

	var roll := randi() % total_weight
	var running := 0

	for i in range(color_weights.size()):
		running += color_weights[i]
		if roll < running:
			return i

	return 0


func upgrade_rarity(rarity: int, amount: int):
	rarity_weights[rarity] += amount


func upgrade_color(color: int, amount: int):
	color_weights[color] += amount


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
