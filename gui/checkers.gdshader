shader_type canvas_item;

uniform float size: hint_range(0.0, 1.0, 0.01);
uniform vec3 color_0: source_color;
uniform vec3 color_1: source_color;

void fragment() {
	vec2 uv = SCREEN_UV * vec2(SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x, 1);
	uv /= size;
	
	COLOR.rgb = mix(color_0, color_1, mod(floor(uv.x) + floor(uv.y), 2.0) * 0.5);
}
