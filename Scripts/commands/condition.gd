extends Node2D

var a
var b
var c

var size = Vector2(330,88)

func _ready():
	a = get_node("GridContainer")
	b = get_node("OptionButton2")
	c = get_node("OptionButton3")

func exe(player):
	var cond = c.get_item_text(c.get_selected_id())
	for e in a.get_children():
		var t = e.name.split(",")
		if e.pressed and cond(player,Vector2(int(t[0]),int(t[1])),cond):
			return true
	return false

func cond(player,dir,what):
	var pos = player.position + dir*50
	if what == "PLAYER":
		for p in Tout.jeu.players.get_children():
			if eq(p.position,pos):
				return true
	
	return false

func eq(acond,bcond):
	var cond = b.get_item_text(b.get_selected_id())
	if cond == "==":
		return acond == bcond
	elif cond == "!=":
		return acond != bcond
	printerr("eq condition script."+cond+" don't exists")
	return false

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))

func calcsize():
	pass


func _on_LineEdit_mouse_entered():
	print("in")


func _on_LineEdit_gui_input(event):
	print("input")
