extends Control

@onready var back_to_main = preload("res://scenes/Menus/main_menu.tscn")

func _on_easy_mode_pressed() -> void:
	Globals.mode = "easy"
	queue_free()
	SceneSwitcher.show_scene(SceneSwitcher.SCENE.OFFICE)
	SaveGame.save_game(Globals.current_game)


func _on_medium_mode_pressed() -> void:
	queue_free()
	Globals.mode = "medium"
	SceneSwitcher.show_scene(SceneSwitcher.SCENE.OFFICE)
	SaveGame.save_game(Globals.current_game)


func _on_hard_mode_pressed() -> void:
	queue_free()
	Globals.mode = "hard"
	SceneSwitcher.show_scene(SceneSwitcher.SCENE.OFFICE)
	SaveGame.save_game(Globals.current_game)


func _on_back_pressed() -> void:
	SceneSwitcher.show_scene(back_to_main)
