extends Control


signal lost_focus


var focused: bool


func _on_focus_entered() -> void:
	focused = true


func _on_mouse_exited() -> void:
	focused = false
	release_focus() 
