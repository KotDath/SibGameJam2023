extends State
class_name PlayerIdle

var player: Player

var i = 0

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if i == 0:
		await player.ready
	print('stayed')
	i += 1
	player.animated_sprite.play("idle")

func Physics_Update(_delta: float):
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	if horizontal_direction and player.can_walk:
		Transitioned.emit(self, "run")

	var vertical_direction = Input.get_axis("ui_down", "ui_up")
	if vertical_direction and player.can_climb:
		Transitioned.emit(self, "climb")

	if Input.is_action_pressed("interact") and InteractionManager.can_interact:
		Transitioned.emit(self, "work")

func Exit():
	player.animated_sprite.stop()
