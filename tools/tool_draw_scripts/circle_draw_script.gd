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
	
	var c: Vector2i
	var l: Vector2i
	
	#if modifiers.ctrl_pressed:
		#c = mouse_pos_from_hold
		#l = Vector2(mouse_pos - mouse_pos_from_hold).length()
	#else:
		#c = (mouse_pos + mouse_pos_from_hold) / 2
		#l = Vector2(mouse_pos - mouse_pos_from_hold).length() / 2
	
	c = mouse_pos_from_hold
	l = mouse_pos - mouse_pos_from_hold
	
	canvas.draw_pixels(canvas.get_ellipse_edge_points(c, l), fg_color, settings.blend)
