extends ScrollContainer
class_name ZoomScrollContainer

@export var default_zoom: float = 1.0
@export var step_size: float = 0.025
@export var node: Control

var zoom: float


func _ready() -> void:
	zoom = default_zoom
	await item_rect_changed
	_update_node_zoom()

func _input(event: InputEvent) -> void:
	var m := event as InputEventMouseButton
	if not m == null:
		if m.ctrl_pressed:
			var axis = m.button_index == MouseButton.MOUSE_BUTTON_WHEEL_UP as float
			axis -= m.button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN as float
			zoom += axis * step_size
			zoom = max(zoom, step_size)
			_update_node_zoom()
			get_viewport().set_input_as_handled()


func _update_node_zoom():
	if node:
		node.custom_minimum_size = size * zoom
