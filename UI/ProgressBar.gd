extends ProgressBar

func _ready():
	var sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("ba1c6a")
	Will.start()
	Will.HealthChanged.connect(update)
	update()

func update():
	value = Will.CurrentWill * 100 / Will.MaxWill
