extends ProgressBar

func _ready():
	Will.start()
	Will.HealthChanged.connect(update)
	update()

func update():
	value = Will.CurrentWill * 100 / Will.MaxWill
