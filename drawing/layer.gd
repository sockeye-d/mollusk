extends TextureRect
class_name Layer


@export var drawable: bool = false
@export var layer_name: String
var canvas: ImageExt


func create(layer_size: Vector2i, layer_name: String) -> void:
	canvas = ImageExt.new(Image.create(layer_size.x, layer_size.y, false, Image.FORMAT_RGBA8))
	self.layer_name = layer_name


func _ready() -> void:
	canvas = ImageExt.new(Image.create(64, 64, false, Image.FORMAT_RGBA8))
	#texture = ImageTexture.create_from_image(canvas.image)


func _process(_delta: float) -> void:
	canvas.image.fill(Color.TEAL)
	canvas.draw_line(Vector2i(32, 32), get_local_mouse_position() as Vector2i, Color8(0, 0, 0, 127))
	#canvas.draw_line_thick(Vector2i(32, 32), get_local_mouse_position() as Vector2i, 0, Color8(0, 0, 0, 127))
	#canvas.draw_rect(Rect2i(Vector2i(32, 32), (get_local_mouse_position() as Vector2i - Vector2i(32, 32))), Color8(0, 0, 0, 127), true )
	#texture.update(canvas.image)
