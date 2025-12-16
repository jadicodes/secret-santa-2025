class_name Gem
extends TextureRect

enum Colors {
	RED,
	YELLOW,
	GREEN,
	BLUE
}

@export var color_type: Colors


func activate():
	if color_type == Colors.RED:
		modulate = Color.RED
	if color_type == Colors.YELLOW:
		modulate = Color.YELLOW
	if color_type == Colors.GREEN:
		modulate = Color.GREEN
	if color_type == Colors.BLUE:
		modulate = Color.BLUE
