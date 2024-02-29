extends TextureRect
class_name Layer


@export var drawable: bool = false
@export var layer_name: String
var opacity: float = 1.0:
	set(v):
		modulate.a = v
	get:
		return modulate.a

@onready var mouse_pos_node = Nodes.get_unique_node("MousePositionNode")
var canvas: ImageExt
var local_mouse_norm: Vector2:
	get:
		return mouse_pos_node.get_global_transform().affine_inverse() * mouse_pos_node.get_global_mouse_position() / mouse_pos_node.size[size.max_axis_index()]
var local_mouse: Vector2i:
	get:
		return Vector2i(local_mouse_norm * canvas.size)


func create(layer_size: Vector2i, _layer_name: String, fill_color: Color) -> void:
	canvas = ImageExt.new(Image.create(layer_size.x, layer_size.y, false, Image.FORMAT_RGBA8))
	canvas.image.fill(fill_color)
	layer_name = _layer_name
	texture = ImageTexture.create_from_image(canvas.image)


func update():
	texture.update(canvas.image)
