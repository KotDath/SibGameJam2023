extends Area2D

var player: Player


func _ready():
	player = get_tree().get_first_node_in_group("Player")
	area_entered.connect(player.on_floor_checker_body_entered)    
	area_exited.connect(player.on_floor_checker_body_exited)    
