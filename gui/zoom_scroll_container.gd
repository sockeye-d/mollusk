extends ScrollContainer
class_name ZoomScrollContainer


@export var default_zoom: float = 1.0
@export var step_size: float = 0.025
@export var node: Control


var zoom: float
var old_scroll: Vector2
var old_mouse: Vector2


func _ready() -> void:
	zoom = default_zoom


func _process(_delta: float) -> void:
	var mouse: Vector2 = get_global_mouse_position()
	if Input.is_action_just_pressed("pan"):
		old_scroll = Vector2(scroll_horizontal, scroll_vertical)
		old_mouse = mouse
	if Input.is_action_pressed("pan"):
		scroll_horizontal = old_scroll.x - mouse.x + old_mouse.x as int
		scroll_vertical = old_scroll.y - mouse.y + old_mouse.y as int
	
	_update_node_zoom()


func _input(event: InputEvent) -> void:
	var m := event as InputEventMouseButton
	if not m == null:
		if m.ctrl_pressed:
			var axis = m.button_index == MouseButton.MOUSE_BUTTON_WHEEL_UP as float
			axis -= m.button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN as float
			zoom += axis * step_size
			zoom = max(zoom, step_size)
			get_viewport().set_input_as_handled()


func _update_node_zoom():
	if node:
		node.custom_minimum_size = Vector2.ONE * size.y * zoom
