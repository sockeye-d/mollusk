@tool
class_name SliderCombo extends Range


signal slider_value_changed(v: float)


enum DraggingStates {
	NONE,
	CLICKED,
	DRAGGING,
}


@export var mouse_draggable: bool = true
@export var mouse_threshold: float = 3
@export var mouse_drag_scale: float = 0.001
@export var editable: bool = true:
	set(v):
		line_edit.editable = v
		slider.editable = v
	get:
		return line_edit.editable or slider.editable


var slider_value:
	set(v):
		v = _constrain(v)
		slider.value = v
		line_edit.text = str(snapped(v, step))
		slider_value_changed.emit(v)
	get:
		return line_edit.text.to_float()


var line_edit: LineEdit
var slider: Slider
var container: VBoxContainer

var dragging_state: DraggingStates = DraggingStates.NONE
var drag_mouse_pos: Vector2


func _init() -> void:
	line_edit = LineEdit.new()
	line_edit.size_flags_horizontal = Control.SIZE_FILL
	line_edit.size_flags_vertical = Control.SIZE_EXPAND_FILL
	line_edit.text_submitted.connect(_on_text_submitted)
	line_edit.gui_input.connect(_on_line_edit_input)
	
	slider = HSlider.new()
	slider.value_changed.connect(_on_value_changed)
	slider_value = value
	slider.min_value = min_value
	slider.max_value = max_value
	slider.step = step
	
	container = VBoxContainer.new()
	container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	container.resized.connect(_resize)
	container.add_theme_constant_override("separation", 0)
	
	add_child(container)
	container.add_child(line_edit)
	container.add_child(slider)


func _process(delta: float) -> void:
	slider.min_value = min_value
	slider.max_value = max_value
	slider.step = step


func _on_text_submitted(new_text: String) -> void:
	var val = new_text.to_float()
	
	val = _constrain(val)
	
	line_edit.text = str(val)
	slider.value = val
	
	line_edit.release_focus()


func _on_value_changed(v: float) -> void:
	slider_value = v


func _on_line_edit_input(event: InputEvent) -> void:
	if mouse_draggable:
		if event is InputEventMouseButton:
			var e = event as InputEventMouseButton
			
			if e.pressed:
				dragging_state = DraggingStates.CLICKED
				drag_mouse_pos = e.global_position
			
			if not e.pressed and dragging_state == DraggingStates.DRAGGING:
				dragging_state = DraggingStates.NONE
				line_edit.editable = true
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				Input.warp_mouse(drag_mouse_pos)
		
		if event is InputEventMouseMotion:
			var e = event as InputEventMouseMotion
			
			if abs(e.global_position.x - drag_mouse_pos.x) > mouse_threshold and dragging_state == DraggingStates.CLICKED:
				dragging_state = DraggingStates.DRAGGING
				drag_mouse_pos = e.global_position
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				line_edit.editable = false
			
			if dragging_state == DraggingStates.DRAGGING:
				slider_value += e.relative.x * mouse_drag_scale * (max_value - min_value)


func _resize() -> void:
	custom_minimum_size.y = container.size.y


func _constrain(v: float) -> float:
	if not allow_lesser:
		v = maxf(v, min_value)
	if not allow_greater:
		v = minf(v, max_value)
	return snappedf(v, step)
