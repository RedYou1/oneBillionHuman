extends Node2D

var move

var size = Vector2()

var random = RandomNumberGenerator.new()

signal end()
var ended = {}

func _ready():
	random.randomize()
	move = get_node("grid")
	calcsize()

func exe(player):
	move.exe(player)
	while not move.ended.has(player.name):
		yield(move,"end")
	var r = move.ended[player.name]
	move.ended.erase(player.name)
	
	if len(r) > 0:
		var ran = random.randi_range(0,len(r)-1)
		var dir = r[ran] * 50
		player.move_and_collide(dir)
		ended[player.name] = dir
		emit_signal("end")
		return
	
	ended[player.name] = null
	emit_signal("end")

func calcsize():
	size = Vector2(110+move.rect_size.x,88)
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(0,0,0))


func _on_OptionButton_item_selected(index):
	calcsize()
