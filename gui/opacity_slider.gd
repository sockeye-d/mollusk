extends SliderCombo


func _ready() -> void:
	Layers.layer_selection_changed.connect(_on_layer_selection_changed)
	slider_value_changed.connect(_on_slider_value_changed)


func _process(delta: float) -> void:
	editable = not Layers.selected_layer == null


func _on_slider_value_changed(v: float) -> void:
	if Layers.selected_layer == null:
		return
	
	Layers.selected_layer.opacity = v


func _on_layer_selection_changed() -> void:
	if Layers.selected_layer == null:
		return
	
	slider_value = Layers.selected_layer.opacity
