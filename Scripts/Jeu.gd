extends Node

var tree

const commands = {
	"say":preload("res://Scenes/commands/say.tscn"),
	"if":preload("res://Scenes/commands/if.tscn"),
	"var":preload("res://Scenes/commands/var.tscn")
}

func _ready():
	tree = get_node("block")
	



func _on_print_play_pressed():
	var t = commands["if"].instance()
	t.name = str(tree.get_child_count())
	tree.add(t)


func _on_play_pressed():
	Tout.vars = {}
	tree.exe()


func _on_erase_pressed():
	for e in tree.get_children():
		e.queue_free()
