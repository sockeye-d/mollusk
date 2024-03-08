extends Control


var focused: bool
var mouse_inside: bool


func _process(delta: float) -> void:
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not mouse_inside and focused:
		focused = false
		release_focus()


func _on_focus_entered() -> void:
	focused = true
	mouse_inside = true


func _on_mouse_exited() -> void:
	mouse_inside = false
