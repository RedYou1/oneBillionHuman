extends Node2D

var size = Vector2(350,500)
var scroll
var playing = false

signal end()
var ended = {}

func _ready():
	scroll = get_tree().root.get_node("Jeu/HBoxContainer/VBoxContainer/ScrollContainer")


func exe(player):
	playing = true
	for i in get_children():
		i.exe(player)
		while not i.ended.has(player.name):
			yield(i,"end")
		i.ended.erase(player.name)
	ended[player.name] = null
	playing = false
	emit_signal("end")

func add(child):
	add_child(child)
	
	Tout.jeu.tree.calcsize()

func try_add(command):
	if playing:
		return null
	
	var pos = get_global_mouse_position()
	
	if Tout.jeu.tree == self:
		#check if mouse is in the square
		if pos.x < scroll.rect_position.x or pos.x > scroll.rect_position.x+scroll.rect_size.x:
			return null
	
	pos = pos.y - position.y - scroll.scroll_vertical
	
	if get_child_count() == 0 or pos < get_child(0).position.y:
		var t = command.instance()
		add_child(t)
		move_child(t,0)
		Tout.jeu.tree.calcsize()
		return t
	
	for i in range(get_child_count()):
		var e = get_child(i)
		pos -= e.size.y
		if pos < 0:
			if e.has_method("try_add"):
				return e.try_add(command)
			else:
				var t = command.instance()
				add_child_below_node(e,t)
				Tout.jeu.tree.calcsize()
				return t
			return null
	
	var t = command.instance()
	add_child(t)
	Tout.jeu.tree.calcsize()
	return t

func replace():
	if get_child_count() > 0:
		get_child(0).calcsize()
		
		get_child(0).position = Vector2()
		for i in range(1,get_child_count()):
			get_child(i).calcsize()
			
			var t = get_child(i-1)
			get_child(i).position = t.position + Vector2(0,t.size.y)

func calcsize():
	replace()
	size = Vector2()
	for i in range(get_child_count()):
		var t = get_child(i)
		t.calcsize()
		if t.size.x > size.x:
			size.x = t.size.x
		size.y += t.size.y
	if size.x == 0:
		size = Vector2(350,20)
	
	if Tout.jeu.tree == self:
		if size.x < 350:
			size.x = 350
		if size.y < 500:
			size.y = 500
		var a = get_parent()
		var b = a.get_parent()
		b.rect_min_size = size
		b.rect_size = size
		size *= float(Tout.jeu.zoom)/100
		a.size = size
	
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(1,0,0))
