extends TextureRect


var canvas: ImageExt


func _ready() -> void:
	canvas = ImageExt.new(Image.create(128, 128, false, Image.FORMAT_RGBA8))
	texture = ImageTexture.create_from_image(canvas.image)
	

func _process(delta: float) -> void:
	canvas.image.fill(Color.WHITE)
	#canvas.draw_line(Vector2i(64, 64), get_local_mouse_position() as Vector2i, Color.BLACK)
	canvas.draw_circle(Vector2i(64, 64), (get_local_mouse_position() as Vector2i - Vector2i(64, 64)).length(), Color.BLACK)
	texture.update(canvas.image)
