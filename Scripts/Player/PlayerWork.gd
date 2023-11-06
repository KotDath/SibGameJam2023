extends State
class_name PlayerWork

var player: Player
var timer

func Enter():
	InteractionManager.can_interact = false
	player = get_tree().get_first_node_in_group("Player")
	player.animated_sprite.scale = Vector2(0.8, 0.8)
	player.animated_sprite.play("work")
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", _on_timer_timeout)
	print('lets go')
	timer.set_wait_time(2)
	timer.start()

func Exit():
	player.animated_sprite.scale = Vector2(1, 1)
	InteractionManager.can_interact = true
	player.animated_sprite.stop()
	timer.stop()

func _on_timer_timeout():
	Transitioned.emit(self, "idle")
