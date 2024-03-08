extends ToolSetting
class_name SliderToolSetting


@export var min_value: float
@export var max_value: float
@export var step: float
@export var default_value: float
@export var mouse_draggable: bool = true
@export var mouse_drag_scale: float = 0.001


func create_control() -> Control:
	var slider = SliderCombo.new()
	slider.set_anchors_preset(Control.PRESET_HCENTER_WIDE)
	slider.min_value = min_value
	slider.max_value = max_value
	slider.slider_value_changed.connect(_update_value)
	slider.slider_value = default_value
	slider.mouse_draggable = mouse_draggable
	slider.mouse_drag_scale = mouse_drag_scale
	_update_value(default_value)
	
	return slider
