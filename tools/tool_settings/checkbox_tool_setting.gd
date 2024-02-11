extends ToolSetting
class_name CheckboxToolSetting


@export var default_value: bool


func create_control() -> Control:
	var control = CheckBox.new()
	control.set_anchors_preset(Control.PRESET_CENTER_LEFT)
	control.toggled.connect(_update_value)
	control.button_pressed = default_value
	_update_value(default_value)
	
	return control
