extends Control

var name_field : RichTextLabel
var content_field: RichTextLabel

var thoughts

func load_thoughts():
	var json = JSON.new()
	var file = FileAccess.open("res://resources/thoughts.json", FileAccess.READ)
	var content = file.get_as_text()
	var error = json.parse(content)
	if error == OK:
		thoughts = json.data

func get_thoughts(key: String):
	var variants = thoughts[key]
	var rand_value = variants[randi() % variants.size()]
	return rand_value


func _ready():
	randomize()
	load_thoughts()
	name_field = get_child(0).get_child(0) as RichTextLabel
	content_field = get_child(0).get_child(1) as RichTextLabel

	var content = get_thoughts("start_game")
	name_field.append_text(content["name"])
	content_field.push_color(Color(content["color"]))
	content_field.append_text(content["content"])
