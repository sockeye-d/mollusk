extends SplitContainer
class_name TripleSplitContainer


var _last_split_offset: int = split_offset


func _process(_delta: float) -> void:
	var offset_offset: int = _last_split_offset - split_offset
	if not offset_offset == 0:
		for child in get_children():
			if child is SplitContainer:
				var split_container := child as SplitContainer
				split_container.split_offset += offset_offset
	_last_split_offset = split_offset
