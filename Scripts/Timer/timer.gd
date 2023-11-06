extends Node

@export
var StartCountdown : int = 0

@export 
var StartTime : int = 0

var CurrentCountdown : int
var CurrentTime : int

func _ready():
    timer = Timer.new()

