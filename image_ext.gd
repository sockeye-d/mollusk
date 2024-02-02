class_name ImageExt


@export var image: Image


func _init(in_image: Image) -> void:
	image = in_image

#region Drawing code
func draw_line(p0: Vector2i, p1: Vector2i, color: Color) -> void:
	var p: Vector2i = p0;
	var d: Vector2i = abs(p1 - p0)
	d.y = -d.y
	var s: Vector2i = sign(p1 - p0)
	var err: int = d.x + d.y
	
	for i in max(d.x, -d.y) + 1:
		if _in_box(p, Vector2i.ZERO, image.get_size()):
			image.set_pixelv(p, color)
		
		if err * 2.0 >= d.y:
			err += d.y
			p.x += s.x
		# Else does *not* work
		if err * 2.0 <= d.x:
			err += d.x
			p.y += s.y


func draw_circle(c: Vector2i, r: int, color: Color) -> void:
	for i in r * 2.0 + 1:
		var x_norm: float = (i as float) / r - 1
		var y: int = sqrt(1.0 - x_norm * x_norm) * r * 0.999999
		
		image.fill_rect(Rect2i(
				Vector2i(i - r, -y) + c,
				Vector2i(1, y * 2.0)), color)
#endregion

#region Util code
func _in_box(p: Vector2i, min: Vector2i, max: Vector2i):
	return p.x >= min.x and p.x < max.x and p.y >= min.y and p.y < max.y
#endregion
