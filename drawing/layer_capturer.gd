class_name LayerCapturer extends Node


var vp: SubViewport
var size: Vector2i:
	set(v):
		size = v
		vp.size = v
	get:
		return size
var layers: Array[Image]
var scene_tree: SceneTree


func _init() -> void:
	vp = SubViewport.new()
	#vp.transparent_bg = true
	#vp.disable_3d = true
	vp.render_target_clear_mode = SubViewport.CLEAR_MODE_ONCE
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	#var w2d = World2D.new()
	
	#vp.world_2d = w2d


func add_layer(layer: Layer) -> void:
	layers.append(layer.canvas.image)


func add_layers(layers: Array[Layer]) -> void:
	for layer in layers:
		add_layer(layer)


func generate_image() -> Image:
	var vp_tex: ViewportTexture
	
	for child in vp.get_children():
		vp.remove_child(child)
	
	var container = Control.new()
	container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	vp.add_child(container)
	
	for layer in layers:
		var tex_rect = TextureRect.new()
		tex_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tex_rect.stretch_mode = TextureRect.STRETCH_KEEP
		tex_rect.texture = ImageTexture.create_from_image(layer)
		container.add_child(tex_rect)
	
	await get_tree().process_frame
	
	vp_tex = vp.get_texture()
	
	await get_tree().process_frame
	
	return vp_tex.get_image()
