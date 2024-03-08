extends AcceptDialog
class_name NewLayerDialog


signal accepted(name: String, fill_color: Color)


@export var default_name_0: Array[String] = [
#region colors
# https://gd.tumeo.space/?KYDwLsB2AmDOAEA5A9tYAodA3AhgJ3gGNkAbZPBAXngCIBBEgS0OACESBXDAYgDEAGXgA5evdHUhhGARy4B1ABaMI6PnQCirACIB2cbJyr+g0WLoGAtvkaQeO01oAs4gF4c8PAabGtgjAOaeAKy8QVoAwuisjLCynrzqjuHO7DiEANZGxtlRJDiQhArA0AwWyDCqoprhWrlcWcaidcAAaoykwGCqQnQATKzqvVF4yADukKp0Qb19dFHuJACecsioqlqaQkJ64ThoYOz13CEAnOp0-OjhCvhgHhywdqbGVwrIxHkq3Fq9AGwnAEZ1FdyDgSJVePYgpdwuRIAAzMijYB4Q48X6OE5BdS1WF4SCwRgkTJ8URCCJXPCMCywcrrcIAxwAZki4UW+Sy3nQWnw6TRDX4QlY3N5bI53GMQqFIrw6QA4qQ0JAAEprbisLa-fjCnmyuV4HCLSYnOgmk4y+UeI3cU22826y3AKBZDEvB0AaRu6UYqm0rB0vx1vIAsjhApJDNwhZKg7KAPJMLDAfVOibHIKB3piB1xg2QQIQoThN283OFRjQVQnE5M3rhSIO5XFbqsbKXB0AZTBZTT6mrvx0c07wBwKedUd4rHCIgtHc+bE4PEcQiZWmlnfn+sNqizjl4e9nm6tO-3p4tABV3LJkDEeMZwjiARa2h0utwTo5jFomdynQAHAAFGwSVERka1-YA-w7dJFn5CVtVMblqS3a1-jQ+1kOPbh0P+blUECVFF1UIEThMdBeEYDxWCpDJfV6ej6PIsgDRIRRlHiXg6AEcjyGAWAwDHNN6KFRjeA4QpCUjURGjEOUcBsWAACNyGQekIgpOU3n4tivmEPTZMVCFdBeBUSCVVVK2+Ogpl6S4UO6QVHPQFNrSERy3Ocjxx0lHJBIATWAEgkUmLRRCzdAAAlymARYtGAUZKhMbiorAIDIBA3h-lYZwAEkYEYfIm0smognCUr0Dy6AAlU7hHFbQUhhyrByGtbxuM9HBvUS9RfiLdAABkcCTGAUVUHqes4gahqgNBCIeBQIS8IIpvGQTVB0cJeGLS5+uAHtrkYeF4TpUlOJqAaAgUA4iJtLQ1x6i7-CuvEwUStyPP6y6wDFXskrET6noExUoAsgKgrGSouLoH5Hqu+zvlXRHYYErDvzRn8Abhry01I9Q+x2r60oy1hfgZZGuxIHsIQuQdyZHNbuFs1gZjmTGwGg2Cbu2B9JrZuccAgeGdB0LZq3Jo8YvWkWhDFvmIECuDW2SDZkbB4LToSAmLDvEwXk+7WGdrGpawu2w004gQHtDcMwCkgQyNDEYTrctt0GDYpGA4CxzA4HBHZsdFSa0ay3Y9r24Lbc73aqr2yyUSzWCmMIf2jz2LAA9w-xIHgax0fgtGFVOvY7ensdUFlWCZHQnyLix+YgOCdBJoQ8dDmO67-Kl8wZxpbTbtPLzwa9b1UZctABet+69l9s7AIrVHCaugiEZbgwrSAvrggFAROPO3Zsb6PBwCxKhCUQ5jX-jFlVR4IUSdQa-eQgcEJc2Ejq5bECGnAACtkB0+IGxoboC-lga0bYPIJmgINFglRQrYl+OgBMjAkwORdpcZBSYtAGkUqoQMLdeg-lzPkAspIpgvGIfmYA89SSOGhBgvA5ZLLBzzloRBAEwTJmBiqNUeN1A9DmBw7ODMTgiFYKI9AQjgCD2HrfG0CQ+GSM4TPToNCC553Ahwv8hocBsT-HfXgWhloARHIUDOR0jJ0HEZIlEHAF5riCEyMQRMITFnCMKACnAT7fGDvnWoAExizUVvwdQIT2GZ2zg5Hy6AmyKWAIQZ+Gc8BZ0DkyJkYsaHSRyDfWCIxxi+mnHpGJyB2QkDgo4AE-wH7oC7NAaA2dqJjDTEKOhAIfwUypmoNyOghhdhgLkpplRHB0EcFqGppdUw7n4awIIegS44A7EUIKi1sTAg7IwKAkBIwXGmL0Wo6ySBJjwAvfgbjLgczgtzPGwp64LiOL8KYdBzq3KFo5UiNSJbWjzm5d5HZIAQ1OlDGpncbD+B7iYewNT5ZlJuqMoQ-RnDnnFD8bKfVzwjnBPBd6lxzxKH4pE74QpDFCHQOeZAVgwA1VEL8Jkjg9AyI4DeORn5QlaEuCot8eN4Wt0UCON8oQNiV3QAAxaiEAEdjKOkYIoRQjoDVgC7wLx5WjBEU878QwaCYHhBwAo8AAD6R9oCLAABQAEoABc6B4DWvgLgAgthRh6o+OQKg8AADaABdK1NrjoEGdQQGwRBSAuoAHSwCzsoY1NAAA6eBo2QBoBa71NqbX+vgNQf1Ya7iMD-Hq4ogRYBmuTSm+Ah0g3MTdfwD16bqA0G4DQS1Jam1BskDYeozby3kHTZ2vAIbKV6tgFsqVTqX7ADNSGjwWc0hjpoHqmgAAaWgtBTXFpTWWzN4amBgCjcusNjAXBjtNfAAAfPAAEjaO2pvKFISA7bm0OqdcGigIacB-j-DNY1-qV0puLSCyQUa3WJuLb6ntpbIDwAff62AF6m3rqfTBktABIP926Y00BoPAAA1KB7DaH51AZTShqNHqCM2qAA
	"aqua",
	"aquamarine",
	"azure",
	"beige",
	"bisque",
	"black",
	"blue",
	"brown",
	"chartreuse",
	"chocolate",
	"coral",
	"cornsilk",
	"crimson",
	"cyan",
	"fuchsia",
	"gainsboro",
	"gold",
	"gray",
	"grey",
	"green",
	"indigo",
	"ivory",
	"khaki",
	"lavender",
	"lime",
	"linen",
	"magenta",
	"maroon",
	"navy",
	"olive",
	"orange",
	"orchid",
	"peru",
	"pink",
	"plum",
	"purple",
	"red",
	"salmon",
	"sienna",
	"silver",
	"snow",
	"tan",
	"teal",
	"thistle",
	"tomato",
	"turquoise",
	"violet",
	"wheat",
	"white",
	"yellow",
#endregion
]
@export var default_name_1: Array[String] = [
#region things
	"rhubarb",
	"croissant",
	"dragonfruit",
	"bratwurst",
	"escargot",
	"macaron",
	"salsa",
	"carbonara",
	"sugarcane",
	"poutine",
	"lychee",
	"gyoza",
	"endive",
	"whelk",
	"jumbalaya",
	"kiwi",
	"muesli",
	"ham",
	"burrito",
	"blt",
	"omelette",
	"calamari",
	"apricot",
	"cheeto",
	"turnip",
	"macaron",
	"cilantro",
	"almond",
	"gusher",
	"strawberrie",
	"persimmon",
	"kohlrabi",
	"salsa",
	"dandelion",
	"guacamole",
	"cheeto",
	"walnut",
	"quesadilla",
	"cheesecake",
	"quinoa",
	"raisin",
	"vindaloo",
	"donut",
	"papaya",
	"bread",
	"plum",
	"hazelnut",
	"edamame",
	"baclava",
	"dandelion",
	"rope",
	"paperclip",
	"paper",
	"tv",
	"umbrella",
	"cup",
	"sunglasses",
	"chicken",
	"paint",
	"tiger",
	"wallet",
	"blouse",
	"ladle",
	"lime",
	"hamster",
	"dog",
	"twister",
	"quilt",
	"carrots",
	"buckle",
	"shirt",
	"basketball",
	"fork",
	"toothbrush",
	"sheep",
	"crowbar",
	"pocketwatch",
	"scarf",
	"table",
	"banana",
	"locket",
	"cars",
	"whip",
	"rhino",
	"syrup",
	"hammer",
	"popcorn",
	"key",
	"binoculars",
	"book",
	"clothes",
	"flag",
	"radio",
	"catalogue",
	"cd",
	"orange",
	"earrings",
	"plate",
	"sofa",
	"lighter",
#endregion
]


func _ready() -> void:
	%LineEdit.text = default_name_0.pick_random() + " " + default_name_1.pick_random()


func _process(delta: float) -> void:
	var can_accept = %OptionButton.selected > 0 and not %LineEdit.text == ""
	get_ok_button().disabled = not can_accept


func _on_option_button_item_selected(index: int) -> void:
	$VBoxContainer/ColorPickerButton.visible = index == 6


func _on_confirmed() -> void:
	accepted.emit(%LineEdit.text, _get_fill_color(%OptionButton.selected))
	queue_free()


func _get_fill_color(index: int) -> Color:
	match index:
		1:
			return Color.TRANSPARENT
		2:
			return Color.BLACK
		3:
			return Color.WHITE
		4:
			return Layers.color_picker.colors[DualColorPicker.COLOR_FG]
		5:
			return Layers.color_picker.colors[DualColorPicker.COLOR_BG]
		5:
			return %ColorPickerButton.color
	return Color.BLACK
