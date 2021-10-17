extends Control

export var command = preload("res://Scenes/commands/say.tscn")

func _ready():
	add_child(command.instance())

func _process(delta):
	rect_position = get_global_mouse_position() - get_child(0).rect_size/2
