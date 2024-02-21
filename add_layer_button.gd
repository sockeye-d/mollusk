extends Button


@export var dialog_scene: PackedScene = preload("res://gui/new_layer_dialog.tscn")


func _on_pressed() -> void:
	var dialog: NewLayerDialog = dialog_scene.instantiate()
	add_child(dialog)
	dialog.accepted.connect(_on_new_layer_dialog_accepted)
	dialog.popup_centered()


func _on_new_layer_dialog_accepted(layer_name: String, fill_color: Color) -> void:
	var layer = Layers.add_layer(Vector2i.ONE * 32, layer_name, fill_color)
	print(layer.get_index())
	Layers.select_layer(layer.get_index())
