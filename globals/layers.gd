extends Node


enum {
	UP = -1,
	DOWN = 1,
}


var layer_scene: PackedScene = preload("res://drawing/layer.tscn")
var layer_item_scene: PackedScene = preload("res://gui/layer_item.tscn")


var layer_container: Node
var layer_item_container: Node


var selected_layer_item: LayerItem
var selected_layer: Layer
var _layers: Array[LayerItem]


func _ready() -> void:
	if get_tree().root.has_node("Main"):
		layer_container = Nodes.get_unique_node("LayerContainer")
		layer_item_container = Nodes.get_unique_node("LayerList")


func add_layer(size: Vector2i, layer_name: String, fill_color: Color) -> void:
	size = Vector2i(64, 64)
	var layer: Layer = layer_scene.instantiate() as Layer
	layer.create(size, layer_name, fill_color)
	layer_container.add_child(layer)
	var layer_item: LayerItem = layer_item_scene.instantiate() as LayerItem
	layer_item.create(layer_name)
	layer_item_container.add_child(layer_item)
	layer_item_container.move_child(layer_item, 0)
	_layers.push_front(layer_item)
	_update_layer_selected()


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
	_layers[index].selected = true
	selected_layer_item = _layers[index]
	_update_layer_selected()


func deselect_layers() -> void:
	for layer in _layers:
		layer.selected = false
	selected_layer_item = null


func _update_layer_selected() -> void:
	selected_layer = layer_container.get_child(get_layer_index(selected_layer_item)) as Layer
