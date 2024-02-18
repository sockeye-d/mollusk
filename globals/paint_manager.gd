extends Node

var color_picker: DualColorPicker
var tool_label_container: Control
var tool_value_container: Control
var info_bar_left: Dictionary = {}
var info_bar_right: Dictionary = {}

func _ready() -> void:
	if get_tree().root.has_node("Main"):
		color_picker = Nodes.get_unique_node("ColorPicker")
		tool_label_container = Nodes.get_unique_node("ToolLabelContainer")
		tool_value_container = Nodes.get_unique_node("ToolValueContainer")


var mouse_pos: Vector2i
var mouse_pos_last: Vector2i
var mouse_pos_from_hold: Vector2i
var should_draw: bool

var tool: Tool:
	set(value):
		tool = value
		_add_tool_settings(tool)
	get:
		return tool


func _process(delta: float) -> void:
	if not Layers.selected_layer_item == null and not tool == null:
		mouse_pos = Layers.selected_layer.local_mouse
		
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
					print("drew!")
					should_draw = false
			
			Tool.ActivationModes.MOUSE_CLICK:
				if Input.is_action_just_pressed("click"):
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
			color_picker.bg
			)
	Layers.selected_layer.update()


func _add_tool_settings(tool: Tool) -> void:
	for child in tool_label_container.get_children() + tool_value_container.get_children():
		child.queue_free()
	
	for setting in tool.tool_settings:
		var label = setting.create_label()
		var control = setting.create_control()
		
		label.size_flags_horizontal = Control.SIZE_SHRINK_END
		control.set_anchors_preset(Control.PRESET_HCENTER_WIDE)
		
		tool_label_container.add_child(label)
		tool_value_container.add_child(control)
		
		if label.size.y > control.size.y:
			control.custom_minimum_size.y = label.size.y
		else:
			label.custom_minimum_size.y = control.size.y
