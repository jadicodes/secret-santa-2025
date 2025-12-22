class_name BingoTracker
extends Resource

signal cell_collected(color: int, rarity: int)

# board[color][rarity] = bool
var board := []

func _init():
	for c in BingoColor.Type.values():
		board.append([])
		for _r in Rarity.Type.values():
			board[c].append(false)


func collect(color: int, rarity: int):
	if board[color][rarity]:
		return
	board[color][rarity] = true
	cell_collected.emit(color, rarity)


func is_collected(color: int, rarity: int) -> bool:
	return board[color][rarity]

func is_board_full() -> bool:
	for color in BingoColor.Type.values():
		for rarity in Rarity.Type.values():
			if not board[color][rarity]:
				return false
	return true
