extends Node

var vars = {}

var selector = preload("res://Scenes/Selector.tscn")
var jeu

func _ready():
	jeu = get_tree().root.get_node("Jeu")

func select(command):
	if jeu.has_node("Selector"):
		var n = jeu.get_node("Selector")
		if n.command == command:
			return
		else:
			jeu.remove_child(n)
	
	var selec = selector.instance()
	selec.command = command
	jeu.add_child(selec)
