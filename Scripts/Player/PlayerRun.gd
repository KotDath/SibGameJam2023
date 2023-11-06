extends State
class_name PlayerRun

var player: Player



func Enter():
	player = get_tree().get_first_node_in_group("Player")
	player.animated_sprite.play("run")


func Physics_Update(_delta: float):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * player.Velocity
		if player.velocity.x > 0:
			player.animated_sprite.set_flip_h(false)
		if player.velocity.x < 0:
			player.animated_sprite.set_flip_h(true)
		player.velocity.y = 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.Velocity)
		Transitioned.emit(self, "idle")

	player.move_and_slide()

func Exit():
	player.animated_sprite.stop()
	player.animated_sprite.play("idle")