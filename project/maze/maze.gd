class_name MazeSection
extends Node2D

const NUMBER: int = 5
var _key: Key
var _counter: int
var _inventory: int = 100

@onready var _keys_spawned_label = %KeysSpawnedLabel
@onready var _bingo_machine_panel = %BingoMachinePanel
@onready var _bingo_entry_label = %BingoEntryLabel
@onready var _inventory_label = %InventoryLabel


func _ready():
	_determine_spawn_keys()
	_inventory_label.text = "You have collected " + str(_inventory) + " keys."
	_bingo_machine_panel.hide()


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
	_keys_spawned_label.text = "Today, " + str(counter) + " keys spawned."


func add_key_to_inventory(amount: int):
	_inventory += amount
	_inventory_label.text = "You have collected " + str(_inventory) + " keys."


func _on_bingo_machine_interacted_with() -> void:
	_bingo_machine_panel.show()


func _on_use_key_button_pressed() -> void:
	if _inventory <= 0:
		return
	var bingo_entry = $BingoMachine.get_bingo_numbers()
	_bingo_entry_label.text = bingo_entry.get_bingo_name()
	$BingoBoard.board.collect(bingo_entry.get_color(), bingo_entry.get_rarity())
	add_key_to_inventory(-1)


func _on_close_button_pressed() -> void:
	%BingoMachinePanel.hide()
