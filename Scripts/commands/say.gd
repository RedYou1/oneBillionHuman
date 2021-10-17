extends Node2D

var say

var size = Vector2(180,56)

func _ready():
	say = get_node("LineEdit")

func exe():
	print(say.text)

func calcsize():
	pass

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))
