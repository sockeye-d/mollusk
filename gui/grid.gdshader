shader_type canvas_item;

uniform vec2 resolution;
uniform vec4 back_color: source_color;
uniform vec4 grid_color: source_color;

void fragment() {
	vec2 uv = UV * resolution;
	vec2 wrapped_uv = abs(fract(uv) - 0.5);
	float mask = max(wrapped_uv.x, wrapped_uv.y) * 2.0;
	
	// Uses (uv.x + uv.y) inside the screen space derivative calculation because
	// using mask produced discontinuities
	mask = smoothstep(1.0 - length(vec2(dFdx(uv.x + uv.y), dFdy(uv.x + uv.y))) * 2.0, 1.0, mask);
	
	COLOR = mix(back_color, grid_color, mask);
}
