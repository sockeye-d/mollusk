@tool
extends AcceptDialog
class_name LineEditAcceptDialog

signal text_confirmed(text: String)

@export var hint_text: String = "":
	set(value):
		$LineEdit.placeholder_text = value
	get:
		return $LineEdit.placeholder_text



func _on_confirmed() -> void:
	text_confirmed.emit($LineEdit.text)
	$LineEdit.text = ""
	hide()
