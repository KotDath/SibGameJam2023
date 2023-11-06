extends Node

signal TimeChanged

@export
var StartCountdown : int = 0

@export 
var StartTime : int = 0

@export
var StartHour : int = 0


var CurrentCountdown : int
var CurrentTime : int

var timer = null

func _ready():
	CurrentTime = StartTime
	CurrentCountdown = StartCountdown
	StartHour += CurrentTime / 60
	CurrentTime = CurrentTime % 60
	StartHour = StartHour % 24
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", _on_timer_timeout)
	print('lets go')
	timer.set_wait_time(60)
	timer.start()
	if CurrentCountdown <= 0:
		timer.stop()
		print('You win')
	TimeChanged.emit()

func increase_time(time: int):
	CurrentTime += time
	if CurrentTime >= 60:
		CurrentCountdown -= 1
		StartHour += 1
		StartHour = StartHour % 24
		CurrentTime = CurrentTime % 60
	if CurrentCountdown <= 0:
		timer.stop()
		print('You win')
	TimeChanged.emit()


func _on_timer_timeout():
	CurrentTime += 1
	if CurrentTime >= 60:
		CurrentCountdown -= 1
		StartHour += 1
		StartHour = StartHour % 24
		CurrentTime = CurrentTime % 60
	if CurrentCountdown <= 0:
		timer.stop()
		print('You win') # экран победы
	TimeChanged.emit()
