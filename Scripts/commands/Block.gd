extends Node2D

var jeu
var size = Vector2(350,500)
var calcsize = true

func _ready():
	jeu = get_tree().root.get_node("Jeu")
	calcsize = jeu.get_node("block") != self


func exe(player):
	for i in get_children():
		i.exe(player)

func add(child):
	add_child(child)
	
	jeu.tree.replace()

func try_add(command):
	var pos = get_global_mouse_position()
	if not calcsize:
		#check if mouse is in the square
		if pos.x < position.x or pos.x > position.x+size.x:
			return null
	
	pos = pos.y - position.y
	
	if get_child_count() == 0 or pos < get_child(0).position.y:
		var t = command.instance()
		add_child(t)
		move_child(t,0)
		jeu.tree.replace()
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
				jeu.tree.replace()
				return t
			return null
	
	var t = command.instance()
	add_child(t)
	jeu.tree.replace()
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
	if calcsize:
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
		update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(1,0,0))
