class_name Tool
extends Resource


@export var icon: Texture2D
@export var name: String
@export var tool_settings: Array[ToolSetting]
@export var draw_script: Script:
	set(value):
		draw_script = value
	get:
		return draw_script


var _script_obj = Object.new()


var settings: Dictionary:
	get:
		settings.clear()
		for setting in tool_settings:
			settings.merge({ setting.label : setting.value })
		return settings


func draw(
		canvas: ImageExt,
		mouse_pos: Vector2i,
		mouse_pos_last: Vector2i,
		mouse_pos_from_hold: Vector2i,
		fg_color: Color,
		bg_color: Color
		) -> void:
	
	if _script_obj.get_script() == null:
		_script_obj.set_script(draw_script)
		draw_script.reload()
	
	_script_obj.draw(canvas, settings, mouse_pos, mouse_pos_last, mouse_pos_from_hold, fg_color, bg_color)
