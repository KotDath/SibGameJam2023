extends State
class_name PlayerClimb

var player: Player

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(_delta: float):
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		player.velocity.y = direction * player.LadderVelocity
	else:
		player.velocity.y = move_toward(player.velocity.x, 0, player.Velocity)
		Transitioned.emit(self, "idle")

	player.move_and_slide()
