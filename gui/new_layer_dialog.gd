extends AcceptDialog
class_name NewLayerDialog


signal accepted(name: String, fill_color: Color)


func _process(delta: float) -> void:
	var can_accept = %OptionButton.selected > 0 and not %LineEdit.text == ""
	get_ok_button().disabled = not can_accept


func _on_option_button_item_selected(index: int) -> void:
	$VBoxContainer/ColorPickerButton.visible = index == 6


func _on_confirmed() -> void:
	accepted.emit(%LineEdit.text, _get_fill_color(%OptionButton.selected))
	queue_free()


func _get_fill_color(index: int) -> Color:
	match index:
		1:
			return Color.TRANSPARENT
		2:
			return Color.BLACK
		3:
			return Color.WHITE
		4:
			return Layers.color_picker.colors[DualColorPicker.COLOR_FG]
		5:
			return Layers.color_picker.colors[DualColorPicker.COLOR_BG]
		5:
			return %ColorPickerButton.color
	return Color.BLACK
