extends Node2D

var cond
var exe

var size

signal end()
var ended = {}

func _ready():
	cond = get_node("condition")
	exe = get_node("block")
	calcsize()

func exe(player):
	if condexe(player):
		exe.exe(player)
		while not exe.ended.has(player.name):
			yield(exe,"end")
		exe.ended.erase(player.name)
	ended[player.name] = null
	emit_signal("end")

func condexe(player):
	cond.exe(player)
	while not cond.ended.has(player.name):
		yield(cond,"end")
	var a = cond.ended[player.name]
	cond.ended.erase(player.name)
	return a

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
	
	size = Vector2(380,100) + Vector2(0,exe.size.y)
	
	update()
