extends ColorRect

var h

func _ready():
	h = get_node("VBoxContainer")

func exe():
	for i in h.get_children():
		i.exe()

func add(node):
	h.add_child(node)
