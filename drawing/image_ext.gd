class_name ImageExt
extends RefCounted


const OFFSETS: Dictionary = {
	false: [
		Vector2i(1, 0),
		Vector2i(0, 1),
		Vector2i(-1, 0),
		Vector2i(0, -1),
	],
	
	true: [
		Vector2i(1, 0),
		Vector2i(1, 1),
		Vector2i(0, 1),
		Vector2i(-1, 1),
		Vector2i(-1, 0),
		Vector2i(-1, -1),
		Vector2i(0, -1),
		Vector2i(1, -1),
	]
}


@export var image: Image
var data: PackedByteArray:
	set(value):
		image.set_data(image.get_width(), image.get_height(), image.has_mipmaps(), image.get_format(), value)
	get:
		return image.get_data()
var size: Vector2:
	get:
		return Vector2(image.get_size())


func _init(in_image: Image) -> void:
	image = in_image

#region Drawing code
func draw_pixel(p: Vector2i, a: Color, blend: bool = false) -> void:
	if _in_box(p, Vector2i.ZERO, image.get_size()):
		image.set_pixelv(p, a if not blend else image.get_pixelv(p).blend(a))


func draw_rect(rect: Rect2i, color: Color, blend: bool = false) -> void:
	if blend:
		rect = rect.abs()
		for x in rect.size.x:
			for y in rect.size.y:
				var p = Vector2i(x, y) + rect.position
				draw_pixel(p, color)
	else:
		image.fill_rect(rect, color)


func draw_pixels(ps: Array[Vector2i], color: Color, blend: bool = false) -> void:
	for p in ps:
		draw_pixel(p, color, blend)


func erase_pixel(p: Vector2i, strength: float) -> void:
	if _in_box(p, Vector2i.ZERO, size):
		var color = image.get_pixelv(p)
		color.a = clamp(color.a - strength, 0.0, 1.0)
		image.set_pixelv(p, color)


func erase_pixels(ps: Array[Vector2i], strength: float) -> void:
	for p in ps:
		erase_pixel(p, strength)


func draw_line(p0: Vector2i, p1: Vector2i, color: Color, blend: bool = false) -> void:
	draw_pixels(get_line_points(p0, p1), color, blend)


func draw_line_thick(p0: Vector2i, p1: Vector2i, thickness: int, color: Color) -> void:
	var offset_vec: Vector2 = Vector2(p1 - p0).normalized().orthogonal() * float(thickness - 1) * 0.5
	var p0s: Array[Vector2i] = get_line_points(Vector2i(Vector2(p0) - offset_vec), Vector2i(Vector2(p0) + offset_vec), true)
	var p1s: Array[Vector2i] = get_line_points(Vector2i(Vector2(p1) - offset_vec), Vector2i(Vector2(p1) + offset_vec), true)
	for i in p0s.size():
		if i < p1s.size():
			draw_line(p0s[i], p1s[i], color)


func get_fill_points(p: Vector2i, tolerance: float, do_corners: bool = false) -> Array[Vector2i]:
	var this_pixel_color: Color = image.get_pixelv(p)
	# Uses a dictionary instead of an array because the dictionary's .has(n) check is *much* faster
	var visited: Dictionary = {}
	var queue: Array[Vector2i] = [p]
	
	while queue.size() > 0:
		var n: Vector2i = queue.pop_back()
		if not visited.has(n):
			if _in_box(n, Vector2i.ZERO, size):
				var color_diff = _color_difference(image.get_pixelv(n), this_pixel_color)
				if color_diff < tolerance:
					visited.merge({n: null})
					for i in OFFSETS[do_corners].size():
						queue.push_back(n + OFFSETS[do_corners][i])
	
	# Type the dictionary keys
	var arr_typed: Array[Vector2i] = []
	arr_typed.assign(visited.keys())
	return arr_typed


func get_line_points(p0: Vector2i, p1: Vector2i, double_pixels: bool = false) -> Array[Vector2i]:
	var arr: Dictionary = {}
	var p: Vector2i = p0;
	var d: Vector2i = abs(p1 - p0)
	d.y = -d.y
	var s: Vector2i = sign(p1 - p0)
	var err: int = d.x + d.y
	
	for i in max(d.x, -d.y) + 1:
		arr.merge({p : null})
		
		if err * 2.0 >= d.y:
			err += d.y
			p.x += s.x
			if double_pixels:
				arr.merge({p : null})
		# Else does *not* work
		if err * 2.0 <= d.x:
			err += d.x
			p.y += s.y
			if double_pixels:
				arr.merge({p : null})
	var arr_typed: Array[Vector2i] = []
	arr_typed.assign(arr.keys())
	return arr_typed


func get_circle_edge_points(center: Vector2i, r: int) -> Array[Vector2i]:
	r = abs(r)
	var arr: Array[Vector2i] = []
	var t1: int = r / 16
	var p = Vector2i(r, 0)
	while p.x >= p.y:
		for i in 2:
			for j in 4:
				arr.append(center + p)
				p = Vector2i(p.y, -p.x)
			p.x = -p.x
		
		p.y += 1
		t1 += p.y
		var t2 = t1 - p.x
		if t2 >= 0:
			t1 = t2
			p.x -= 1
	return arr


func get_circle_fill_points(c: Vector2i, r: int) -> Array[Vector2i]:
	r = abs(r)
	var arr: Array[Vector2i] = []
	for x in r * 2 + 1:
		for y in r * 2 + 1:
			var p: Vector2i = Vector2i(x - r, y - r)
			if (p as Vector2).length() < r - 0.5:
				arr.append(c + p)
	return arr


func get_ellipse_edge_points(center: Vector2i, r: Vector2i) -> Array[Vector2i]:
	# http://members.chello.at/%7Eeasyfilter/Bresenham.pdf
	r = abs(r)
	var arr: Array[Vector2i] = []
	var p: Vector2i = Vector2i(-r.x, 0)
	var e2: int = r.y * r.y
	var err: int = p.x * (2 * e2 + p.x) + e2
	
	while p.x <= 0:
		arr.append(center + p * Vector2i( 1,  1))
		arr.append(center + p * Vector2i(-1,  1))
		arr.append(center + p * Vector2i( 1, -1))
		arr.append(center + p * Vector2i(-1, -1))
		
		e2 = 2 * err
		if e2 >= (p.x * 2 + 1) * r.y * r.y:
			p.x += 1
			err += (p.x * 2 + 1) * r.y * r.y
		
		if e2 <= (p.y * 2 + 1) * r.x * r.x:
			p.y += 1
			err += (p.y * 2 + 1) * r.x * r.x
		
	
	while p.y < r.y:
		p.y += 1
		arr.append(center + p * Vector2i(0,  1))
		arr.append(center + p * Vector2i(0, -1))
	return arr


func get_ellipse_fill_points(center: Vector2i, r: Vector2i) -> Array[Vector2i]:
	r = r.abs()
	var arr: Array[Vector2i] = []
	for x in r.x * 2 + 1:
		for y in r.y * 2 + 1:
			var p: Vector2i = Vector2i(x, y) - r
			if ((Vector2(p)) / Vector2(r)).length() < 0.99:
				arr.append(center + p)
	return arr


func get_rectangle_edge_points(center: Vector2i, r: Vector2i) -> Array[Vector2i]:
	r = r.abs()
	var arr: Array[Vector2i] = []
	
	for x in range(-r.x, r.x + 1, 1):
		arr.append(center + Vector2i(x,  r.y))
		arr.append(center + Vector2i(x, -r.y))
	
	for y in range(-r.y + 1, r.y, 1):
		arr.append(center + Vector2i( r.x, y))
		arr.append(center + Vector2i(-r.x, y))
	
	return arr


func get_rectangle_fill_points(center: Vector2i, r: Vector2i) -> Array[Vector2i]:
	r = r.abs()
	var arr: Array[Vector2i] = []
	
	for x in range(-r.x, r.x, 1):
		for y in range(-r.y, r.y, 1):
			arr.append(center + Vector2i(x, y))
	
	return arr
#endregion

#region Util code
func _in_box(p: Vector2i, p_min: Vector2i, p_max: Vector2i):
	return p.x >= p_min.x and p.x < p_max.x and p.y >= p_min.y and p.y < p_max.y


func _color_difference(a: Color, b: Color) -> float:
	var d = a * a.a - b * b.a
	return sqrt(d.r * d.r + d.g * d.g * d.b * d.b + d.a * d.a) / 2.0
#endregion
