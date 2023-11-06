extends Node2D

var thought_system: ThoughtEngine

	
@onready var interaction_area: InteractionArea = $interaction_area

@export var SpawnWill : float
@export var DespawnWill: float
@export var DeltaWill: float

@export var DeltaTime: int

@export var phrase_key: String

@export var is_once_activate: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	thought_system = get_tree().get_first_node_in_group("Thought")
	Will.HealthChanged.connect(_change_will)

	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	Will.decrease_life(DeltaWill)
	TimerNode.increase_time(DeltaTime)
	thought_system.draw_text(phrase_key)
	if is_once_activate:
		queue_free()



func _change_will():
	if Will.CurrentWill >= SpawnWill or Will.CurrentWill <= DespawnWill:
		hide()
		(interaction_area.get_child(0) as CollisionShape2D).set_disabled(true)
	else:
		show()
		(interaction_area.get_child(0) as CollisionShape2D).set_disabled(false)
