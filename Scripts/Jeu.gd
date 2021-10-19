extends Node

var tree
var players

const commands = {
	"say":preload("res://Scenes/commands/say.tscn"),
	"if":preload("res://Scenes/commands/if.tscn")
}

func _ready():
	tree = get_node("block")
	players = get_node("players")


func _on_play_pressed():
	Tout.vars = {}
	for player in players.get_children():
		tree.exe(player)


func _on_erase_pressed():
	for e in tree.get_children():
		e.queue_free()
