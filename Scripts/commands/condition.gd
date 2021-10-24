extends Node2D

var a
var b
var c

var size = Vector2(330,88)

signal end()
var ended = {}

func _ready():
	a = get_node("GridContainer")
	b = get_node("OptionButton2")
	c = get_node("OptionButton3")

func exe(player):
	var cond = c.get_item_text(c.get_selected_id())
	for e in a.get_children():
		if e.pressed:
			var t = e.name.split(",")
			var condv = cond(player,Vector2(int(t[0]),int(t[1])),cond)
			if b.get_item_text(b.get_selected_id()) == "!=":
				condv = not condv
			if condv:
				ended[player.name] = true
				emit_signal("end")
				return
	ended[player.name] = false
	emit_signal("end")

func cond(player,dir,what):
	var pos = player.position + dir*50
	if what == "PLAYER":
		for p in Tout.jeu.players.get_children():
			if p.position == pos:
				return true
	elif what == "CUBE":
		for p in Tout.jeu.get_node("Map/cubes").get_children():
			if p.position == pos:
				return true
	elif what == "WALL":
		for p in Tout.jeu.get_node("Map/walls").get_children():
			if p.position == pos:
				return true
	return false

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))

func calcsize():
	pass


func _on_LineEdit_mouse_entered():
	print("in")


func _on_LineEdit_gui_input(event):
	print("input")
