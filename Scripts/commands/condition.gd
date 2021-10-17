extends Node2D

var a
var b

var size = Vector2(224,56)

func _ready():
	a = get_node("LineEdit")
	b = get_node("LineEdit2")

func exe():
	return a.text == b.text

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))

func calcsize():
	pass
