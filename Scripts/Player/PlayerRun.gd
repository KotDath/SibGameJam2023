extends State
class_name PlayerRun

var player: Player

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(_delta: float):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.Velocity
		player.velocity.y = 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.Velocity)
		Transitioned.emit(self, "idle")

	player.move_and_slide()
