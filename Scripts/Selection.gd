extends Button


export var command = preload("res://Scenes/commands/say.tscn")

func _pressed():
	Tout.select(command)
