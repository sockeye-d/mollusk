extends PanelContainer
class_name LayerItem


@export var layer_name: String:
	set(value):
		layer_name = value
		if not $MarginContainer/HBoxContainer/Label == null:
			$MarginContainer/HBoxContainer/Label.text = layer_name
	get:
		return layer_name
@export var selected: bool

var last_clicked_time: float = -1.0
var editing: bool = false


@onready var name_input: LineEdit
@onready var name_input_select_button: Button


func create(_layer_name: String) -> void:
	layer_name = _layer_name
	$MarginContainer/HBoxContainer/Label.text = layer_name


func _ready() -> void:
	name_input = $MarginContainer/HBoxContainer/Label
	name_input_select_button = $MarginContainer/HBoxContainer/Label/SelectButton


func _process(delta: float) -> void:
	if not name_input.has_focus():
		if last_clicked_time > 0.2 or not selected:
			last_clicked_time = -1.0
			name_input_select_button.show()
			name_input.editable = false
		else:
			last_clicked_time += delta
	
	if selected:
		modulate = Color(1.5, 1.5, 1.5)
	else:
		modulate = Color(1.0, 1.0, 1.0)


func _on_select_button_pressed() -> void:
	Layers.select_layer(Layers.get_layer_index(self))
	if last_clicked_time < 0.0:
		last_clicked_time = 0.0
		name_input_select_button.hide()
		name_input.editable = true


func _on_delete_button_pressed() -> void:
	Layers.remove_layer(get_index())


func _on_up_button_pressed() -> void:
	Layers.move_layer(get_index(), Layers.UP)


func _on_down_button_pressed() -> void:
	Layers.move_layer(get_index(), Layers.DOWN)


func _on_label_text_submitted(new_text: String) -> void:
	layer_name = new_text
	name_input_select_button.show()
	name_input.editable = false


func _on_label_focus_exited() -> void:
	layer_name = name_input.text
	name_input_select_button.show()
	name_input.editable = false
