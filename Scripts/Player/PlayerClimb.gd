extends State
class_name PlayerClimb

var player: Player

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	

func Physics_Update(_delta: float):
	if (!player.can_climb):
		Transitioned.emit(self, "idle")
	
	var up = Input.get_action_strength("ui_up")
	var down = Input.get_action_strength("ui_down")

	var direction = down - up

	if direction:
		player.velocity.y = direction * player.LadderVelocity
		player.velocity.x = 0
	else:
		player.velocity.y = move_toward(player.velocity.x, 0, player.Velocity)
		Transitioned.emit(self, "idle")
	player.move_and_slide()
	if player.position.y <= player.LastLadder.position.y:
		player.position.y = player.LastLadder.position.y + 1
	if player.position.y > player.LastLadder.end.y:
		player.position.y = player.LastLadder.end.y - 1
