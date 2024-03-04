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
	
	var a = mouse_pos_from_hold
	var b = mouse_pos
	
	if modifiers.shift_pressed:
		b = b - a
		b = a + Vector2i.ONE * max(b.x, b.y)
	
	var c: Vector2i
	var l: Vector2i
	
	if modifiers.ctrl_pressed:
		c = a
		l = a - b
	else:
		c = (b + a) / 2
		l = (b - a) / 2
	
	canvas.draw_pixels(canvas.get_ellipse_edge_points(c, l), fg_color, settings.blend)
