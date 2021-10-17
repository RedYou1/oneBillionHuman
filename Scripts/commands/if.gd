extends Node2D

var cond
var exe

var size

func _ready():
	cond = get_node("condition")
	exe = get_node("block")
	calcsize()

func exe():
	if cond.exe():
		exe.exe()

func add(node):
	exe.add(node)
	calcsize()
	update()

func try_add(node):
	exe.try_add(node)
	calcsize()
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(1,1,0))

func calcsize():
	exe.calcsize()
	
	size = Vector2(320,56) + Vector2(0,exe.size.y)
