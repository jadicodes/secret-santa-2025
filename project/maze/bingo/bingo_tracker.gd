extends GridContainer

func _ready():
	for gems in get_children():
		gems.activate()
