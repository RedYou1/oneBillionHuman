extends Node2D

var _name
var _var

var size = Vector2(294,56)

func _ready():
	_name = get_node("LineEdit")
	_var = get_node("LineEdit2")

func exe():
	Tout.vars[_name.text] = _var.text

func calcsize():
	pass

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))
