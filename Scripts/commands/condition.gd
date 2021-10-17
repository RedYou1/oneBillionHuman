extends HBoxContainer

var a
var b

func _ready():
	a = get_node("LineEdit")
	b = get_node("LineEdit2")

func exe():
	return a.text == b.text
