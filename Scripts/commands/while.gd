extends Node2D

var cond
var exe

var size

signal end(result)

func _ready():
	cond = get_node("condition")
	exe = get_node("block")
	calcsize()

func exe(player):
	cond.exe(player)
	while yield(cond,"end"):
		exe.exe(player)
		yield(exe,"end")
		cond.exe(player)
	emit_signal("end",null)

func add(node):
	exe.add(node)
	calcsize()
	update()

func try_add(node):
	var t = exe.try_add(node)
	calcsize()
	update()
	return t

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(1,1,0))

func calcsize():
	exe.calcsize()
	
	size = Vector2(500,100) + Vector2(0,exe.size.y)
	
	update()
