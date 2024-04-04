extends Level


func _on_button_pressed():
	SceneSwitcher.show_scene(SceneSwitcher.SCENE.MENU)
	get_tree().change_scene_to_file("res://scenes/Menus/main_menu.tscn")
