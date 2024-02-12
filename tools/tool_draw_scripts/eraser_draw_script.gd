extends DrawScript

func draw(
		canvas: ImageExt,
		settings: Dictionary,
		mouse_pos: Vector2i,
		mouse_pos_last: Vector2i,
		mouse_pos_from_hold: Vector2i,
		fg_color: Color,
		bg_color: Color,
		) -> void:
	
	var points = canvas._get_line_points(mouse_pos, mouse_pos_last)
	points.remove_at(0)
	canvas.erase_pixels(points, settings.strength / 100.0)
