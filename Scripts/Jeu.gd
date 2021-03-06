extends Node

var tree
var players
var zoom = 100
const block = preload("res://Scenes/commands/Block.tscn")

const commands = {
	"say":preload("res://Scenes/commands/say.tscn"),
	"if":preload("res://Scenes/commands/if.tscn")
}

func _ready():
	tree = get_node("HBoxContainer/VBoxContainer/ScrollContainer/ViewportContainer/Viewport/block")
	players = get_node("Map/players")

func _on_play_pressed():
	Tout.vars = {}
	tree.ended = {}
	for player in players.get_children():
		tree.exe(player)


func _on_erase_pressed():
	for e in tree.get_children():
		e.queue_free()


func _on_HSlider_value_changed(value):
	zoom = value
	tree.calcsize()
