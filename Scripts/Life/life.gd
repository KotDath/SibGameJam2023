extends Node
class_name Life

signal HealthChanged

@export
var StartWill: float = 0

@export
var MaxWill : float = 100

var CurrentWill : float

func start():
	CurrentWill = StartWill


func increase_life(heal: float):
	CurrentWill += heal
	HealthChanged.emit()

func decrease_life(damage: float):
	CurrentWill -= damage
	HealthChanged.emit()
	if CurrentWill <= 0:
		pass


func _process(delta):
	if Input.is_action_pressed("shoot"):
		decrease_life(0.1)
	if Input.is_action_pressed("heal"):
		increase_life(0.1)