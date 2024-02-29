extends Node


signal layer_selection_changed


enum {
	UP = -1,
	DOWN = 1,
}


var layer_scene: PackedScene = preload("res://drawing/layer.tscn")
var layer_item_scene: PackedScene = preload("res://gui/layer_item.tscn")


var layer_container: SubViewport
var layer_item_container: Node
var info_bar_left: Dictionary = {}
var info_bar_right: Dictionary = {}


var selected_layer_item: LayerItem
var selected_layer: Layer
var _layers: Array[LayerItem]


func _ready() -> void:
	if get_tree().root.has_node("Main"):
		layer_container = Nodes.get_unique_node("LayerContainer")
		layer_item_container = Nodes.get_unique_node("LayerList")
		
		for child in Nodes.get_unique_node("InfoBar").get_node("LeftBar").get_children():
			info_bar_left.merge({ child.name.to_snake_case(): child })
		
		for child in Nodes.get_unique_node("InfoBar").get_node("RightBar").get_children():
			info_bar_right.merge({ child.name.to_snake_case(): child })


func _process(delta: float) -> void:
	if info_bar_left.has("mouse_position"):
		if selected_layer == null:
			info_bar_left.mouse_position.text = ""
		else:
			info_bar_left.mouse_position.text = str(PaintManager.mouse_pos) + ", " + str(PaintManager.mouse_pos_last)


func add_layer(size: Vector2i, layer_name: String, fill_color: Color) -> LayerItem:
	size = Vector2i(64, 64)
	var layer: Layer = layer_scene.instantiate() as Layer
	layer.create(size, layer_name, fill_color)
	layer.name = layer.layer_name
	layer_container.add_child(layer, true)
	var layer_item: LayerItem = layer_item_scene.instantiate() as LayerItem
	layer_item.create(layer_name)
	layer_item.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	layer_item_container.add_child(layer_item)
	layer_item_container.move_child(layer_item, 0)
	_layers.push_front(layer_item)
	_update_layer_selected()
	
	return layer_item


func move_layer(index: int, dir: int) -> void:
	if not (index + dir < _layers.size() and index + dir >= 0):
		return
	var layer: LayerItem = _layers[index]
	_layers[index] = _layers[index + dir]
	_layers[index + dir] = layer
	layer_container.move_child(layer_container.get_child(index), index + dir)
	layer_item_container.move_child(layer_item_container.get_child(index), index + dir)
	_update_layer_selected()


func remove_layer(index: int) -> void:
	_layers.remove_at(index)
	layer_container.get_child(index).queue_free()
	layer_item_container.get_child(index).queue_free()
	if _layers.size() > 0:
		select_layer(index)
	else:
		deselect_layers()


func get_layer_index(layer_item: LayerItem) -> int:
	return _layers.find(layer_item)


func select_layer(index: int) -> void:
	deselect_layers()
	if index < 0 or index > _layers.size() - 1:
		return
	_layers[index].selected = true
	selected_layer_item = _layers[index]
	_update_layer_selected()


func deselect_layers() -> void:
	for layer in _layers:
		layer.selected = false
	selected_layer_item = null
	_update_layer_selected()


func get_layers() -> Array[Layer]:
	var arr: Array[Layer] = []
	for child in layer_container.get_children():
		arr.append(child)
	return arr


func as_image() -> Image:
	return layer_container.get_texture().get_image()


func _update_layer_selected() -> void:
	layer_container.print_tree_pretty()
	print(layer_container.get_child_count())
	if layer_container.get_child_count() == 0:
		return
	
	selected_layer = layer_container.get_child(-1 - get_layer_index(selected_layer_item)) as Layer
	layer_selection_changed.emit()
