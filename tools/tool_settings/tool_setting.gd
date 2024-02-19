extends Resource
class_name ToolSetting


@export var label: String
var value


func create_label() -> Control:
	var node_label: Label = Label.new()
	node_label.set_anchors_preset(Control.PRESET_CENTER_TOP)
	var text = label.replace("_", " ")
	text[0] = text[0].to_upper()
	node_label.text = text
	return node_label


func create_control() -> Control:
	return null


func _update_value(v):
	value = v
