extends Node


func get_unique_node(node: String) -> Node:
	return get_tree().root.get_node("Main").get_node(NodePath("%" + node))
