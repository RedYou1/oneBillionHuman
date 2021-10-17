extends HBoxContainer

var say

func _ready():
	say = get_node("LineEdit")

func exe():
	print(say.text)
