extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	TimerNode.TimeChanged.connect(draw_time)


func draw_time():
	$TimeLabel.text = "%02d:%02d" % [TimerNode.StartHour, TimerNode.CurrentTime]
	var res = "%02d" % TimerNode.CurrentCountdown
	$CountDown.text = res
