class_name Rarity

enum Type {
	COMMON,
	UNCOMMON,
	RARE,
	LEGENDARY
}

const DISPLAY_NAMES := {
	Type.COMMON: "Common",
	Type.UNCOMMON: "Uncommon",
	Type.RARE: "Rare",
	Type.LEGENDARY: "Legendary"
}

const TEXTURES := {
	Type.COMMON: preload("res://maze/bingo/tile_0062.png"),
	Type.UNCOMMON: preload("res://maze/bingo/tile_0021.png"),
	Type.RARE: preload("res://maze/bingo/tile_0040.png"),
	Type.LEGENDARY: preload("res://maze/bingo/tile_0042.png")
}
