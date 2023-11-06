extends Control

class_name ThoughtEngine

var name_field : RichTextLabel
var content_field: RichTextLabel

var thoughts

var index : Dictionary

func load_thoughts():
	var json = JSON.new()
	var file = FileAccess.open("res://resources/thoughts.json", FileAccess.READ)
	var content = file.get_as_text()
	var error = json.parse(content)
	if error == OK:
		thoughts = json.data
		for key in thoughts.keys():
			index[key] = 0
		

func get_thoughts(key: String):
	var variants = thoughts[key]
	var rand_value = variants[index[key]]
	index[key] += 1
	index[key] = index[key] % variants.size()
	return rand_value


func draw_text(key: String):
	name_field = get_child(0).get_child(0) as RichTextLabel
	content_field = get_child(0).get_child(1) as RichTextLabel

	var content = get_thoughts(key)
	name_field.clear()
	content_field.clear()
	name_field.push_color(Color(content["color"]))
	name_field.append_text(content["name"])
	content_field.push_color(Color("123456"))
	content_field.append_text(content["content"])
	

func _ready():
	load_thoughts()
	draw_text("start_game")
