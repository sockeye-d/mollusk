extends Resource
class_name ToolSetting


@export var label: String
var value


func create_label() -> Control:
	var node_label: Label = Label.new()
	node_label.set_anchors_preset(Control.PRESET_CENTER_RIGHT)
	node_label.text = label
	return node_label


func create_control() -> Control:
	return null


func _update_value(v):
	value = v
