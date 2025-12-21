extends VBoxContainer

@export var colors: BingoColor.Type
@export var rarity: Rarity.Type
@export var _is_rarity: bool
@export var price: int

signal purchase_attempted(amount)

func _ready():
	$Label.text = str(price)
	if _is_rarity:
		$Button.text = Rarity.DISPLAY_NAMES[rarity]
	else:
		$Button.text = BingoColor.DISPLAY_NAMES[colors]


func get_price() -> int:
	return price


func _on_button_pressed() -> void:
	purchase_attempted.emit(price)
