extends Control
class_name action_layout


var number_of_actions: int = Globals.action_type.regular
var action_scene: PackedScene = preload("res://actions/Base/action.tscn")
var close_action_scene: PackedScene = preload("res://actions/Base/close.tscn")
var previous_actions_text: Array[Dictionary] = []
var action_type: String
var actions: Array[VBoxContainer] = []
@onready var options: VBoxContainer = $Background/VBoxContainer/Options
signal action_done


func _ready() -> void:
	if number_of_actions == 4:
		action_type = "Regular"
	else:
		action_type = "Board"
	make_actions()


func make_actions() -> void:
	var action: VBoxContainer
	for i in range(number_of_actions):
		if i < 3:
			action = action_scene.instantiate()
			var random_action: Dictionary = get_action()
			while (
				previous_actions_text.find(random_action) == -1 and
				random_action["Mode(s)"].get(Globals.mode, false) and
				random_action.Type != action_type
			):
				previous_actions_text.append(random_action)
				random_action = get_action()
			
			action.find_child("Text").text = random_action.Text
			action.impacted_stats = random_action.Stats
		else:
			action = close_action_scene.instantiate()
			action.find_child("Text").text = "Close Actions? You can view this later."
		action.connect("close", close)
		actions.append(action)
		options.add_child(action)


func close(type: String) -> void:	
	if type == "close":
		visible = false
	else:
		action_done.emit()
		close_actions()


func close_actions() -> void:
	actions = []
	previous_actions_text = []
	for action in options.get_children():
		options.remove_child(action)
		action.queue_free()
	visible = false
	
	if action_type == "Board":
		SceneSwitcher.show_scene(SceneSwitcher.SCENE.OFFICE)
	
	make_actions()


func get_action() -> Dictionary:
	return Globals.customer_review_texts[randi_range(0,  Globals.customer_review_texts.size() - 1)]


func get_action_size() -> Vector2:
	return get_child(0).size
