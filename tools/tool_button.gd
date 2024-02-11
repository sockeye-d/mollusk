@tool
extends Button
class_name ToolButton


@export var tool: Tool:
	set(value):
		icon = value.icon
		tool = value
	get:
		return tool
@export var update_icon: bool = false:
	set(value):
		icon = tool.icon


func _ready() -> void:
	pressed.connect(_on_pressed)


func _on_pressed() -> void:
	PaintManager.tool = tool
