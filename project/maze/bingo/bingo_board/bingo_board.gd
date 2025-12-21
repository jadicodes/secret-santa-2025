class_name BingoBoard
extends VBoxContainer

@export var board: BingoTracker

func _ready():
	board.cell_collected.connect(_on_cell_collected)
	_refresh_all()


func _refresh_all():
	for cell in get_tree().get_nodes_in_group("bingo_cells"):
		cell.set_collected(
			board.is_collected(cell.color_type, cell.rarity_type)
		)


func _on_cell_collected(color: int, rarity: int):
	for cell in get_tree().get_nodes_in_group("bingo_cells"):
		if cell.color_type == color and cell.rarity_type == rarity:
			cell.set_collected(true)
