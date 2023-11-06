extends CharacterBody2D
class_name Player



@export 
var Velocity : float = 300.0

@export 
var LadderVelocity: float = 100.0

var LastLadder : Rect2

var can_climb: bool = false
var can_walk: bool = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	

func on_ladder_checker_body_entered(body:Node2D):
	print(str('down body entered: ', body.get_name()))
	if body.is_in_group("ladders"):
		can_climb = true
		var ladder = (body.get_node("CollisionShape2D") as CollisionShape2D)
		print(body.position)
		var rect = ladder.shape.get_rect()
		print(body.position, rect.position)
		LastLadder = Rect2(body.position + 2 * rect.position, rect.size)

func on_ladder_checker_body_exited(body:Node2D):
	print(str('down body exited: ', body.get_name()))
	(get_child(0) as CollisionShape2D).disabled = true
	if body.is_in_group("ladders"):
		can_climb = false


func on_floor_checker_body_entered(body:Node2D):
	print(str('floor entered: ', body.get_name()))
	if body is Area2D and !body.is_in_group("ladders"):
		can_walk = true


func on_floor_checker_body_exited(body:Node2D):
	print(str('floor exited: ', body.get_name()))
	if body is Area2D and !body.is_in_group("ladders"):
		print('stop')
		can_walk = false
