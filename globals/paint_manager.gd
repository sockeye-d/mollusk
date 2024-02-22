extends Node


var color_picker: DualColorPicker
var tool_label_container: Control
var tool_value_container: Control
var canvas_focus: Control
var info_bar_left: Dictionary = {}
var info_bar_right: Dictionary = {}


func _ready() -> void:
	if get_tree().root.has_node("Main"):
		color_picker = Nodes.get_unique_node("ColorPicker")
		tool_label_container = Nodes.get_unique_node("ToolLabelContainer")
		tool_value_container = Nodes.get_unique_node("ToolValueContainer")
		canvas_focus = Nodes.get_unique_node("CanvasFocus")


const NONE = Vector2i(-1, -1)
var mouse_pos: Vector2i
var mouse_pos_last: Vector2i = Vector2i(-1, -1)
var mouse_pos_from_hold: Vector2i
var should_draw: bool
var pre_draw_image_data: PackedByteArray

# Stores a BitField<KeyModifierMask>
var modifiers: int


var tool: Tool:
	set(value):
		tool = value
		_add_tool_settings(tool.tool_settings)
	get:
		return tool


func _process(delta: float) -> void:
	if not canvas_focus.focused:
		mouse_pos_last = NONE
	if not Layers.selected_layer_item == null and not tool == null and canvas_focus.focused:
		mouse_pos = Layers.selected_layer.local_mouse
		if mouse_pos_last == NONE:
			mouse_pos_last = mouse_pos
		
		if Input.is_action_just_pressed("click"):
			mouse_pos_from_hold = Layers.selected_layer.local_mouse
		
		if not mouse_pos == mouse_pos_last:
			should_draw = true
		
		match tool.activation_mode:
			Tool.ActivationModes.MOUSE_DRAG:
				if (
						Input.is_action_just_pressed("click")
						or (Input.is_action_pressed("click")
						and should_draw)
				):
					draw()
					should_draw = false
			
			Tool.ActivationModes.MOUSE_CLICK:
				if Input.is_action_just_pressed("click"):
					draw()
			
			Tool.ActivationModes.MOUSE_CLICK_HOLD:
				if Input.is_action_just_pressed("click"):
					pre_draw_image_data = Layers.selected_layer.canvas.data.duplicate()
				
				if Input.is_action_pressed("click"):
					Layers.selected_layer.canvas.data = pre_draw_image_data.duplicate()
					Layers.selected_layer.update()
					draw()
		
		if not mouse_pos == mouse_pos_last:
			should_draw = true
		
		mouse_pos_last = Layers.selected_layer.local_mouse


func draw() -> void:
	tool.draw(
			Layers.selected_layer.canvas,
			mouse_pos,
			mouse_pos_last,
			mouse_pos_from_hold,
			color_picker.fg,
			color_picker.bg,
			modifiers,
			)
	Layers.selected_layer.update()


func _add_tool_settings(settings: Array[ToolSetting]) -> void:
	for child in tool_label_container.get_children() + tool_value_container.get_children():
		child.queue_free()
	
	for setting in settings:
		var label: Label = setting.create_label()
		var control = setting.create_control()
		
		
		label.size_flags_horizontal = Control.SIZE_SHRINK_END
		label.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		control.set_anchors_preset(Control.PRESET_HCENTER_WIDE)
		
		tool_label_container.add_child(label)
		tool_value_container.add_child(control)
		
		if label.size.y > control.size.y:
			control.custom_minimum_size.y = label.size.y
		else:
			label.custom_minimum_size.y = control.size.y


func _input(event: InputEvent) -> void:
	if event is InputEventWithModifiers:
		var e = event as InputEventWithModifiers
		modifiers = e.get_modifiers_mask()
