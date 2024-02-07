extends Node


enum {
	UP = -1,
	DOWN = 1,
}


var layer_scene: PackedScene = preload("res://drawing/layer.tscn")
var layer_item_scene: PackedScene = preload("res://gui/layer_item.tscn")


var current_layer: Layer
var current_layer_index: int
var _layers: Array[LayerItem]


var layer_container: Node
var layer_item_container: Node


func _ready() -> void:
	layer_container = get_tree().root.get_node("Main").get_node("%LayerContainer")
	layer_item_container = get_tree().root.get_node("Main").get_node("%LayerList")


func add_layer(size: Vector2i, layer_name: String) -> void:
	var layer: Layer = layer_scene.instantiate() as Layer
	layer.create(size, layer_name)
	layer_container.add_child(layer)
	var layer_item: LayerItem = layer_item_scene.instantiate() as LayerItem
	layer_item.create(layer_name)
	layer_item_container.add_child(layer_item)
	layer_item_container.move_child(layer_item, 0)
	_layers.push_front(layer_item)


func move_layer(index: int, dir: int) -> void:
	if not (index + dir < _layers.size() and index + dir >= 0):
		return
	var layer: LayerItem = _layers[index]
	_layers[index] = _layers[index + dir]
	_layers[index + dir] = layer
	layer_container.move_child(layer_container.get_child(index), index + dir)
	layer_item_container.move_child(layer_item_container.get_child(index), index + dir)


func remove_layer(index: int) -> void:
	_layers.remove_at(index)
	layer_container.get_child(index).queue_free()
	layer_item_container.get_child(index).queue_free()


func get_layer_index(layer_item: LayerItem) -> int:
	return _layers.find(layer_item)


func select_layer(index: int) -> void:
	for layer in _layers:
		layer.selected = false
	_layers[index].selected = true
