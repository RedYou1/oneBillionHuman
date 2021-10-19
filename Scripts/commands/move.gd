extends Node2D

var say

var size = Vector2()

signal end(result)

func _ready():
	say = get_node("OptionButton")
	calcsize()

func exe(player):
	var t = say.get_item_text(say.get_selected_id())
	if t == "UP":
		player.position.y -= 50
	elif t == "DOWN":
		player.position.y += 50
	elif t == "LEFT":
		player.position.x -= 50
	elif t == "RIGHT":
		player.position.x += 50
	emit_signal("end",t)

func calcsize():
	size = Vector2(96+say.rect_size.x,56)
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))


func _on_OptionButton_item_selected(index):
	calcsize()
