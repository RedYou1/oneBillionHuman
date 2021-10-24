extends GridContainer

export var onlyone = false
export var center = true

var size = Vector2()

var pressed = []

signal end()
var ended = {}

func __init__(onlyone,center):
	self.onlyone = onlyone
	self.center = center

func _ready():
	if not center:
		var b = get_node("0,0")
		var t = MarginContainer.new()
		t.rect_size = b.rect_size
		b.visible = false
		add_child_below_node(b,t)
	if onlyone:
		pressed = null
	calcsize()

func exe(player):
	ended[player.name] = pressed
	emit_signal("end")

func calcsize():
	size = rect_size
	update()

func _draw():
	draw_rect(Rect2(Vector2(),size),Color(.9,.9,.9))


func _on_OptionButton_item_selected(index):
	calcsize()

func cell_pressed(cell):
	var t = cell.name.split(",")
	if cell.pressed:
		if onlyone:
			if pressed != null:
				get_node(str(pressed.x)+","+str(pressed.y)).pressed = false
			pressed = Vector2(int(t[0]),int(t[1]))
		else:
			pressed.append(Vector2(int(t[0]),int(t[1])))
	else:
		if onlyone:
			pressed = null
		else:
			pressed.erase(Vector2(int(t[0]),int(t[1])))
