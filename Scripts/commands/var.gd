extends HBoxContainer

var _name
var _var

func _ready():
	_name = get_node("LineEdit")
	_var = get_node("LineEdit2")

func exe():
	Tout.vars[_name.text] = _var.text
