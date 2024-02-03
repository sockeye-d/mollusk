extends TextureRect


var canvas: ImageExt


func _ready() -> void:
	canvas = ImageExt.new(Image.create(128, 128, false, Image.FORMAT_RGBA8))
	texture = ImageTexture.create_from_image(canvas.image)
	

func _process(delta: float) -> void:
	canvas.image.fill(Color.TEAL)
	#canvas.draw_line(Vector2i(64, 64), get_local_mouse_position() as Vector2i, Color.BLACK)
	canvas.draw_circle(Vector2i(64, 64), (get_local_mouse_position() as Vector2i - Vector2i(64, 64)).length(), Color8(0, 0, 0, 127), true)
	#canvas.draw_rect(Rect2i(Vector2i(64, 64), (get_local_mouse_position() as Vector2i - Vector2i(64, 64))), Color8(0, 0, 0, 127), true )
	texture.update(canvas.image)

