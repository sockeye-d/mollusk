extends ToolSetting
class_name SliderToolSetting


@export var min_value: float
@export var max_value: float
@export var step: float
@export var default_value: float


func create_control() -> Control:
	var slider = SliderCombo.new()
	slider.set_anchors_preset(Control.PRESET_HCENTER_WIDE)
	slider.min_value = min_value
	slider.max_value = max_value
	slider.value_changed.connect(_update_value)
	slider.value = default_value
	_update_value(default_value)
	
	return slider
