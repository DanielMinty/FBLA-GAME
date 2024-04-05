extends Level


@onready var dialouge: Control = preload("res://Dialouge/dialoge.tscn").instantiate()
@onready var board_dialouge: Control = preload("res://actions/Base/board_actions.tscn").instantiate()


func add_dialouge() -> void:
	add_child(board_dialouge)
