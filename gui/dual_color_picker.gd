extends Control
class_name DualColorPicker


enum {
	COLOR_FG = 0,
	COLOR_BG = 1,
}


var colors: Array[Color] = [Color.WHITE, Color.BLACK]
var fg: Color:
	set(value):
		colors[COLOR_FG] = value
	get:
		return colors[COLOR_FG]
var bg: Color:
	set(value):
		colors[COLOR_BG] = value
	get:
		return colors[COLOR_BG]

func _ready() -> void:
	%SwapButton.pressed.connect(swap_colors)
	


func _process(_delta: float) -> void:
	colors[COLOR_FG] = %ColorPickerFG.color
	colors[COLOR_BG] = %ColorPickerBG.color
	custom_minimum_size.y = %ColorPickerBG.custom_minimum_size.y + $VBoxContainer/HBoxContainer2.size.y


func swap_colors():
	colors.push_back(colors[0])
	colors.remove_at(0)
	%ColorPickerFG.color = colors[COLOR_FG]
	%ColorPickerBG.color = colors[COLOR_BG]
