extends Area2D
class_name Ladder 

var player: Player


func _ready():
	add_to_group("ladders")
	player = get_tree().get_first_node_in_group("Player")
	area_entered.connect(player.on_ladder_checker_body_entered)    
	area_exited.connect(player.on_ladder_checker_body_exited)    
