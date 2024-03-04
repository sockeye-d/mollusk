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
	
	var a: Vector2i = mouse_pos_from_hold
	var b: Vector2i = mouse_pos
	
	if modifiers.shift_pressed:
		var ang: float = snappedf(Vector2(b - a).angle(), TAU / settings.angle_steps)
		var len: float = (b - a).length()
		b = a + Vector2i(Vector2.from_angle(ang) * len)
	
	canvas.draw_pixels(canvas.get_line_points(a, b), fg_color, settings.blend)
