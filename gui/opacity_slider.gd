extends SliderCombo


func _ready() -> void:
	Layers.layer_selection_changed.connect(_on_layer_selection_changed)


func _process(delta: float) -> void:
	editable = not Layers.selected_layer == null


func _on_value_changed(v: float) -> void:
	super(v)
	
	if Layers.selected_layer == null:
		return
	
	Layers.selected_layer.opacity = v
	print(Layers.selected_layer.layer_name)


func _on_layer_selection_changed() -> void:
	if Layers.selected_layer == null:
		return
	
	value = Layers.selected_layer.opacity
