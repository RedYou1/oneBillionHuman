extends Node2D

var time

var size = Vector2()

signal end()
var ended = {}

func _ready():
	time = get_node("LineEdit")
	calcsize()

func exe(player):
	var timer = player.get_node("Timer")
	timer.start(float(time.text))
	yield(timer,"timeout")
	ended[player.name] = float(time.text)
	emit_signal("end")

func calcsize():
	size = Vector2(82+time.rect_size.x,56)
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))


func _on_LineEdit_text_changed(new_text):
	if new_text != "" and new_text.is_valid_float():
		time.get("custom_styles/normal").bg_color = Color(.19,.19,.19)
	else:
		time.get("custom_styles/normal").bg_color = Color(.5,.19,.19)
