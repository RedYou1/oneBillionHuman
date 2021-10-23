extends Node2D

var say

var size = Vector2()

signal end()
var ended = {}

func _ready():
	say = get_node("OptionButton")
	calcsize()

func exe(player):
	var t = say.get_item_text(say.get_selected_id())
	print(t)
	ended[player.name] = t
	emit_signal("end")

func calcsize():
	size = Vector2(82+say.rect_size.x,56)
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))


func _on_OptionButton_item_selected(index):
	calcsize()
