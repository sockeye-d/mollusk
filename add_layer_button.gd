extends Button


@export var dialog: PackedScene


func _on_pressed() -> void:
	$LineEditAcceptDialog.popup_centered()


func _on_line_edit_accept_dialog_text_confirmed(_text: String) -> void:
	Layers.add_layer(Vector2i.ONE, _text)
