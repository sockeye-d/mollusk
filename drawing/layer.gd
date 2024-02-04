extends TextureRect
class_name Layer


@export var drawable: bool = false
var canvas: ImageExt


func _init(size: Vector2i) -> void:
	canvas = ImageExt.new(Image.create(size.x, size.y, false, Image.FORMAT_RGBA8))


func _ready() -> void:
	canvas = ImageExt.new(Image.create(64, 64, false, Image.FORMAT_RGBA8))
	#texture = ImageTexture.create_from_image(canvas.image)


func _process(_delta: float) -> void:
	canvas.image.fill(Color.TEAL)
	canvas.draw_line(Vector2i(32, 32), get_local_mouse_position() as Vector2i, Color8(0, 0, 0, 127))
	#canvas.draw_line_thick(Vector2i(32, 32), get_local_mouse_position() as Vector2i, 0, Color8(0, 0, 0, 127))
	#canvas.draw_rect(Rect2i(Vector2i(32, 32), (get_local_mouse_position() as Vector2i - Vector2i(32, 32))), Color8(0, 0, 0, 127), true )
	#texture.update(canvas.image)
