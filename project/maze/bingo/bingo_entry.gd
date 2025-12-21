class_name BingoEntry

var color: int       # BingoColor.Type
var rarity: int      # Rarity.Type


func _init(c: int, r: int):
	color = c
	rarity = r


func get_bingo_name() -> String:
	print("Color: " + BingoColor.DISPLAY_NAMES[color])
	print("Rarity: " + Rarity.DISPLAY_NAMES[rarity])
	var new_name = BingoColor.DISPLAY_NAMES[color] + " " + Rarity.DISPLAY_NAMES[rarity]
	return new_name


func get_color() -> int:
	return color


func get_rarity() -> int:
	return rarity
