extends ToolSetting
class_name SliderToolSetting


@export var min: float
@export var max: float
@export var step: float
@export var default_value: float


func create_control() -> Control:
	var slider = HSlider.new()
	slider.set_anchors_preset(Control.PRESET_HCENTER_WIDE)
	slider.min_value = min
	slider.max_value = max
	slider.value_changed.connect(_update_value)
	slider.value = default_value
	_update_value(default_value)
	
	return slider
