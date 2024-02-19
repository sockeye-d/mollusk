extends DrawScript

func draw(
		canvas: ImageExt,
		settings: Dictionary,
		mouse_pos: Vector2i,
		mouse_pos_last: Vector2i,
		mouse_pos_from_hold: Vector2i,
		fg_color: Color,
		bg_color: Color,
		modifiers: int,
		) -> void:
	
	canvas.draw_pixels(canvas._get_line_points(mouse_pos_from_hold, mouse_pos), fg_color, settings.blend)
