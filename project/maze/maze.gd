class_name MazeSection
extends Node2D

const NUMBER: int = 5
var _key: Key
var _counter: int
var _keys: int = 100
var _coins: int = 0
var _bingo_entry: BingoEntry
var _number_of_seconds: int = 10

@onready var _keys_spawned_label = %KeysSpawnedLabel
@onready var _bingo_machine_panel = %BingoMachinePanel
@onready var _shop_panel = %ShopPanel
@onready var _bingo_entry_label = %BingoEntryLabel
@onready var _keys_label = %KeysLabel
@onready var _coins_label = %CoinsLabel


func _ready():
	_determine_spawn_keys()
	_set_keys_label()
	_set_coins_label()
	$Timer.wait_time = _number_of_seconds
	$Timer.start()
	_bingo_machine_panel.hide()
	$Bed.interacted_with.connect(_on_bed_interacted_with)
	$ShopWorker.interacted_with.connect(_on_shop_worker_interacted_with)
	for wall in get_tree().get_nodes_in_group("wall"):
		wall.interacted_with.connect(_on_walls_interacted_with)


func _set_keys_label():
	_keys_label.text = "You have " + str(_keys) + " keys."


func _set_coins_label():
	_coins_label.text = "You have " + str(_coins) + " coins."


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
	_keys += amount
	_set_keys_label()


func add_coin_to_inventory(amount: int):
	_coins += amount
	_set_coins_label()


func _on_bingo_machine_interacted_with() -> void:
	_bingo_machine_panel.show()


func _on_bed_interacted_with() -> void:
	_kill_keys()
	for wall in get_tree().get_nodes_in_group("wall"):
		wall.undisappear()
	$Timer.stop()
	_determine_spawn_keys()


func _on_use_key_button_pressed() -> void:
	if _keys <= 0:
		return
	_bingo_entry = $BingoMachine.get_bingo_numbers()
	_bingo_entry_label.text = _bingo_entry.get_bingo_name()
	add_key_to_inventory(-1)


func _on_shop_button_pressed(price: int) -> void:
	if not _coins - price < 0:
		add_coin_to_inventory(-price)
		_set_coins_label()


func _on_close_button_pressed() -> void:
	%BingoMachinePanel.hide()


func _on_sell_button_pressed() -> void:
	if _bingo_entry:
		add_coin_to_inventory(_bingo_entry.get_price())
		_set_coins_label()


func _on_keep_button_pressed() -> void:
	if _bingo_entry:
		$BingoBoard.board.collect(_bingo_entry.get_color(), _bingo_entry.get_rarity())


func _on_shop_worker_interacted_with() -> void:
	_shop_panel.show()


func _on_shop_close_button_pressed() -> void:
	_shop_panel.hide()


func _on_timer_timeout() -> void:
	_keys_spawned_label.text = "The keys have disappeared..."
	_kill_keys()


func _kill_keys():
	for key in get_tree().get_nodes_in_group("key"):
		key.queue_free()


func _on_walls_interacted_with():
	for wall in get_tree().get_nodes_in_group("wall"):
		wall.disappear()
	$Timer.start()
