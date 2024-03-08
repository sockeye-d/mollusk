shader_type canvas_item;

vec2 aa_uv(vec2 uv, vec2 px, float w) {
	uv *= px;
	vec2 f = fract(uv);
	return (floor(uv) + min(f / w, vec2(0.5)) + 0.5 - min((1.0 - f) / w, vec2(0.5))) / px;
}

void fragment() {
	vec2 w = fwidthCoarse(UV);
	vec2 tex_size = 1.0 / TEXTURE_PIXEL_SIZE;
	COLOR = textureLod(TEXTURE, aa_uv(UV, tex_size, min(dot(w, vec2(1.0)), 1.0) * max(tex_size.x, tex_size.y)), 0.0);
}
