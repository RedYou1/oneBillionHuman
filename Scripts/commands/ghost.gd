extends Node2D

var size = Vector2(224,56)
signal end(resultat)

func init(command):
	var t = command.instance()
	add_child(t)

func exe(player):
	emit_signal("end",null)

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))

func calcsize():
	pass
