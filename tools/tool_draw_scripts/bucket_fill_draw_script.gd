extends DrawScript

func draw(
		canvas: ImageExt,
		settings: Dictionary,
		mouse_pos: Vector2i,
		mouse_pos_last: Vector2i,
		mouse_pos_from_hold: Vector2i,
		fg_color: Color,
		bg_color: Color,
		modifiers: Dictionary,
		) -> void:
	
	canvas.draw_pixels(canvas.get_fill_points(mouse_pos, settings.tolerance / 100.0, settings.cross_corners), fg_color, settings.blend)
