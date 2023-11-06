extends Area2D
class_name InteractionArea

@export var action_name : String = "interact"

var interact: Callable = func():
	pass


func _on_area_exited(area:Area2D):
	print('collide')
	

func _on_area_entered(area:Area2D):
	print('not collide')
	InteractionManager.register_area(self)
