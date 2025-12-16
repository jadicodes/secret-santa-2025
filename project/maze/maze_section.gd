class_name MazeSection
extends Node2D

const NUMBER: int = 5
var _key: Key
var _counter: int
var _inventory: int = 0


func _ready():
	_determine_spawn_keys()
	$CanvasLayer/Panel.hide()


func _determine_spawn_keys():
	_counter = 0
	for key_generator in $Node.get_children():
		var random = randi_range(0, 10)
		if random > 4:
			_counter += 1
			generate_key(key_generator.global_position)
	replace_text(_counter)


func generate_key(pos):
	_key = preload("res://maze/key/key.tscn").instantiate()
	call_deferred("add_child", _key)
	_key.collected.connect(add_key_to_inventory.bind(1))
	_key.global_position = pos


func replace_text(counter):
	$CanvasLayer/Label.text = "Today, " + str(counter) + " keys spawned."


func add_key_to_inventory(amount: int):
	_inventory += amount
	$CanvasLayer/InventoryLabel.text = "You have collected " + str(_inventory) + " keys."


func _on_bingo_machine_interacted_with() -> void:
	$CanvasLayer/Panel.show()


func _on_use_key_button_pressed() -> void:
	if _inventory <= 0:
		return

	add_key_to_inventory(-1)
