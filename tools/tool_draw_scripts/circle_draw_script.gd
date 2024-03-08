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
	
	var a: Vector2 = mouse_pos_from_hold
	var b: Vector2 = mouse_pos
	
	if modifiers.shift_pressed:
		b = b - a
		b = a + Vector2i.ONE * max(b.x, b.y)
	
	var c: Vector2
	var l: Vector2
	
	if modifiers.ctrl_pressed:
		c = a
		l = a - b
	else:
		c = (b + a) / 2.0
		l = (b - a) / 2.0
	var points: Array[Vector2i]
	
	if modifiers.shift_pressed:
		if settings.filled:
			points = canvas.get_circle_fill_points(c, l.x)
		else:
			points = canvas.get_circle_edge_points(c, l.x)
	else:
		if settings.filled:
			points = canvas.get_ellipse_fill_points(c, l)
		else:
			points = canvas.get_ellipse_edge_points(c, l)
	
	canvas.draw_pixels(points, fg_color, settings.blend)
