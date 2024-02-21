extends TextureRect
class_name Layer


@export var drawable: bool = false
@export var layer_name: String
var opacity: float


var canvas: ImageExt
var local_mouse_norm: Vector2:
	get:
		return get_global_transform().affine_inverse() * get_global_mouse_position() / size[size.max_axis_index()]
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
