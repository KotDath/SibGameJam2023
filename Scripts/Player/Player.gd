extends CharacterBody2D
class_name Player

@onready var animated_sprite = $AnimatedSprite2D

@export 
var Velocity : float = 300.0

@export 
var LadderVelocity: float = 100.0

var LastLadder : Rect2

var can_climb: bool = false
var can_walk: bool = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
func _ready():
	animated_sprite.play("idle")
	

func on_ladder_checker_body_entered(body:Node2D):
	print(str('down body entered: ', body.get_name()))
	if body.is_in_group("ladders") and body.get_name() != 'interaction_area':
		can_climb = true
		var ladder = (body.get_node("CollisionShape2D") as CollisionShape2D)
		var rect = ladder.shape.get_rect()
		LastLadder = Rect2(body.position + 2 * rect.position, rect.size)

func on_ladder_checker_body_exited(body:Node2D):
	print(str('down body exited: ', body.get_name()))
	(get_child(0) as CollisionShape2D).disabled = true
	if body.is_in_group("ladders") and body.get_name() != 'interaction_area':
		can_climb = false


func on_floor_checker_body_entered(body:Node2D):
	print(str('floor entered: ', body.get_name()))
	if body is Area2D and !body.is_in_group("ladders") and body.get_name() != 'interaction_area':
		can_walk = true
	if body.get_name() == 'interaction_area':
		InteractionManager.register_area(body as InteractionArea)


func on_floor_checker_body_exited(body:Node2D):
	print(str('floor exited: ', body.get_name()))
	if body is Area2D and !body.is_in_group("ladders") and body.get_name() != 'interaction_area':
		can_walk = false
	if body.get_name() == 'interaction_area':
		InteractionManager.unregister_area(body as InteractionArea)
