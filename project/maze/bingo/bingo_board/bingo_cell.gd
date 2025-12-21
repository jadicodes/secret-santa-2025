class_name BingoCell
extends TextureRect

@export var color_type: BingoColor.Type
@export var rarity_type: Rarity.Type


func _ready():
	texture = Rarity.TEXTURES[rarity_type]
	modulate = BingoColor.COLORS[color_type]
	set_collected(false)


func set_collected(value: bool):
	modulate.a = 1.0 if value else 0.3
