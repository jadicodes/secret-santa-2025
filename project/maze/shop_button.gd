class_name ShopButton
extends VBoxContainer

@export var colors: BingoColor.Type
@export var rarity: Rarity.Type
@export var is_rarity: bool
@export var price: int
@export var custom: bool
@export var title_override: String

signal purchase_attempted(amount, button)

func _ready():
	$Label.text = str(price)
	if is_rarity:
		$Button.text = Rarity.DISPLAY_NAMES[rarity]
	else:
		$Button.text = BingoColor.DISPLAY_NAMES[colors]
	if custom:
		$Button.text = title_override


func get_price() -> int:
	return price


func get_is_rarity() -> bool:
	return is_rarity


func get_rarity() -> Rarity.Type:
	return rarity


func get_color() -> BingoColor.Type:
	return colors


func _on_button_pressed() -> void:
	purchase_attempted.emit(price, self)
