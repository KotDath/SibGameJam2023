extends State
class_name PlayerIdle

var player: Player

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(_delta: float):
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	if horizontal_direction and player.can_walk:
		Transitioned.emit(self, "run")

	var vertical_direction = Input.get_axis("ui_down", "ui_up")
	if vertical_direction and player.can_climb:
		Transitioned.emit(self, "climb")
