extends ProgressBar

@export var life : Life

func _ready():
	life.start()
	life.HealthChanged.connect(update)
	update()

func update():
	print(life.CurrentWill, life.MaxWill)
	value = life.CurrentWill * 100 / life.MaxWill
