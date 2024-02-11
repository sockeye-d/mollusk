extends Button


@export var dialog_scene: PackedScene = preload("res://gui/new_layer_dialog.tscn")


func _on_pressed() -> void:
	var dialog: NewLayerDialog = dialog_scene.instantiate()
	add_child(dialog)
	dialog.accepted.connect(_on_new_layer_dialog_accepted)
	dialog.popup_centered()


func _on_new_layer_dialog_accepted(name: String, fill_color: Color) -> void:
	Layers.add_layer(Vector2i.ONE * 32, name, fill_color)
