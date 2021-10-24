extends CheckBox

var parent

func _ready():
	parent = get_parent()

func _pressed():
	parent.cell_pressed(self)
