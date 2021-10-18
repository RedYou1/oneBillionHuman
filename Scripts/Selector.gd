extends Node2D

export var command = preload("res://Scenes/commands/say.tscn")
const g = preload("res://Scenes/commands/ghost.tscn")

var jeu
var ghost = null
var last = Vector2()

func _ready():
	jeu = get_tree().root.get_node("Jeu")
	add_child(command.instance())

func _process(delta):
	position = get_global_mouse_position()
	
	if position.x != last.x or position.y != last.y:
		if ghost != null:
			ghost.get_parent().remove_child(ghost)
		
		ghost = jeu.tree.try_add(g)
		if ghost != null:
			ghost.init(command)
		last = Vector2(position)

func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and not event.pressed:
		if ghost != null:
			ghost.get_parent().remove_child(ghost)
		jeu.tree.try_add(command)
		queue_free()
