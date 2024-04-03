extends Node


enum SCENE {OFFICE = 0, TUTORIAL = 1, BOARD = 2, FACTORY = 3, COMPUTER = 4}
@onready var scenes: Array[Node] = [
	preload("res://scenes/Levels/office.tscn").instantiate(),
	preload("res://scenes/Levels/tutorial.tscn").instantiate(),
	preload("res://scenes/Levels/board.tscn").instantiate(),
	preload("res://scenes/Levels/factory.tscn").instantiate(),
	preload("res://scenes/inside_scenes/computer.tscn").instantiate()
]
@onready var root: Window = get_tree().root

func _ready():
	for scene in scenes:
		root.add_child.call_deferred(scene)


func show_scene(scene: SCENE) -> void:
	scenes[scene].visible = true 
	
	if scene == SCENE.BOARD:
		scenes[scene].add_dialouge()

	for s in range(len(scenes)):
		if s != scene:
			scenes[s].visible = false
