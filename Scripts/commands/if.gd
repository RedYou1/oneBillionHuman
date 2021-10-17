extends ColorRect

var cond
var exe

func _ready():
	cond = get_node("VBoxContainer/HBoxContainer/HBoxContainer")
	exe = get_node("VBoxContainer/VBoxContainer")

func exe():
	if cond.exe():
		exe.exe()

func add(node):
	exe.add(node)
