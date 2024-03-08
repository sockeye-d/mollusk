extends SplitContainer
class_name TripleSplitContainer

@export var secondary_split_container: SplitContainer


var _last_split_offset: int = split_offset


func _process(_delta: float) -> void:
	var offset_offset: int = _last_split_offset - split_offset
	if not  offset_offset == 0 and not secondary_split_container == null:
		secondary_split_container.split_offset += offset_offset
	_last_split_offset = split_offset
