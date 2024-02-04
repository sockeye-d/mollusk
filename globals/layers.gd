extends Node


var current_layer: Layer
var current_layer_index: int
var _layers: TreeItem


var layer_container: Node
var layer_tree: TreeItem


func _ready() -> void:
	layer_container = get_tree().root.get_node("Main").get_node("%LayerContainer")
	layer_tree = get_tree().root.get_node("Main").get_node("%LayerTree").create_item()


func add_layer(size: Vector2i) -> void:
	var layer = Layer.new(size)
	layer_container.add_child(layer)
