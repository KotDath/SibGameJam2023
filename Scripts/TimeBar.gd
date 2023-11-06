extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	TimerNode.TimeChanged.connect(draw_time)
	TimerNode.increase_time(0)


func draw_time():
	$TimeLabel.text = "%02d:%02d" % [TimerNode.StartHour, TimerNode.CurrentTime]
	var res = "Осталось %02d часа до..." % TimerNode.CurrentCountdown
	$CountDown.text = res
