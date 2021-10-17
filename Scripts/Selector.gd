extends Node2D

export var command = preload("res://Scenes/commands/say.tscn")

var jeu

func _ready():
	jeu = get_tree().root.get_node("Jeu")
	add_child(command.instance())

func _process(delta):
	position = get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and not event.pressed:
		jeu.tree.try_add(command)
		queue_free()
