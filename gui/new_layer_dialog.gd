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
#region things (specifically food 😳)
# https://gd.tumeo.space/?KYDwLsB2AmDOAEA5A9tYAodA3AhgJ3jAAsBLSAcwQF54AidAMTxOGngC0BXAY29MhLwAQgBtksWMgC2sdABkSUnMOA5IsgCrIcsCGwBKOLCWQiS6IcgCesKACNgeZsFkBhHpykO86AAprIZVdkMDAceRIsR3QAZRwRWHD-MLCEITwjHXQACR4AaxFgbzwreABJbmB4VzxVKViABxxyImBQwQBBEREg-DtkQIz0GuQSCTUwYdqcKWrWlwxDWAbi0rlgKQH4AFlHMnJOKt8WRpnYsAyAd1X4fSJOOz74Y4wAcU4cbhnTN-3omLAZDy+2EYyIyAaw1aTlKLymnzyjlkx10n1I4j8yE4gMgvwojmE02g6AAIhlyAMAGZ4TgkSZCZrAETwDoweByZAgYY4ThmSliS7RfTaXSsOYkbh5BqqWQdBrMbghWQMEiUdCvfBmbiYlLIFwszjwV4ZHF+OnKdKqYmWnBsXycaDQfboOUNQrwABSCM0RFqVW2nFgiIgSMYWIIrnmtmeJAAXrHwhpOHgBJDRIc5sAFsNkCnoMg1QBpJliciUeBMZAhdlVhoIVyOVQiUlqNBmAaxKQkQqwkI4MB62QANTI0HiVYsny2AHUMg1pXayKp54U-EjFJtIFCs9GYljKfyMMXHnZZMbu4U2JGdxhfH2B-qOobjf2yOhtgjG82G9Nm4WMtiOr9sg4p1qcAiwEQtwShg14LBWziyAAiociROt04QAvgCG0pMrg8nyAr-IKbTPPeIFMCwsgAPI2BAeAIMKkrAJSJbRHIahfJBJC1PA2TVnekwaDxMxjJw6D6HSsagmA9ZRhgDKIna5FQhKiKQEgVbQO6e6cJCxzxphTQtG0gIshh1R9AM+DhNkJAAFYkMCUK5nGIGScg9lqMg6DFmsihHCcJKtkyJhbpGalQPAha5koFhEhJVZgCoBIMGI-bvjo8TKCS4jhBFzEaRoUBoAx6ofF8myrhFuLRiqUTwDEDQwfFagVj0iKyB+kFioJwEuOgXC8PwghpcggplYpYqutVnxgIGCFUYlOjJX1D6yHEIg4lUNSfmVcQwJcEqtLKSgZJAxDyBsAytLa6BaCtYqGMYpjmNRUhMqZt4qfhIixgMGAAKJlrcpgJNubQYsEiLPHgqA8LJOTVrlaqGGMZDwA9ujlT1ZUMKMVQvm4PQyOg1FmA1Gp4GgGk2nAgKSrIogIioahuNCJQxhgMS+ooDQsmy56I0I+SXLdyXGtokwzVUcQ8BguWQNifE-LIHqeI8PRWOEU3KbqjVYpCiA4GoFgiIcNzHLiOArrLmwhKQGAfl8cPqEjyVy5UZ5WMgCYSTB0XMMsLCY9MkzZDgsZMkriOSZUzwOk6FCxGYsweoo6CAxQZiQYSqh5JSK33bmgIYZlzG1H+yBECIGR2OYm3bdUGQV7ISwrI4nNwhoNtQLaTuoWYxePQYRgmEPvjAMCFDwCS+RXZu4qFctopXqQhUC2wVNao0ZBoiyeAM+CMMkiQkKRsmcNM6L4tGnDGUxJw5D4F8uLbjCXMuYqPQQJZiLqn8AgdNVIbxtNjZmkpqioHkFYPgO50DThwAed0lEBoBhcEPFCZBtBkwEAMWQEd6g93opjJUmIPpiHOJwA8vVgDziRPAacdIoIMDaEkcijVsrEkfpAfk40CQxCzMSSMyBv79iqO3G46RxoCAGtRPBGlJIUC6pwSAfBxCgU0MmREpQPSODyFYMmtQMRy0SOQAaGhmCHnfBeNoLpzFjm4pjSk4k1ogQimBV4TJXxbiGnwMgo0iJlTgnVAY0BDiYjwHkaCMA3A6FaJcJA2JZAoFQIUNWqiTAEG2GQRGHQaQHB6CA9Szx8BdmfoETOsAXYUjySITccB-aKlCOEO4Dw+guljJwYErMtyAzHEoD66AhzADLCHEWeBzE+HwtKKBa8z4bRcDMWWQifQ4EEPoMU7gYTvl9gmSuPRGoMzyLIYKMBQodjggOGi-YPrxFuOs2AGNgjIGBANBk3Aei4EYKqLqJAQBihGeYsIdh0kIKQYeZEHCPFQpEFgXMAMEC7BABKNq05WBJ3IFA15S07xRJiY03adhy6b0zNmbYez8AlmUACNSG18BJwGgCK4xQqKkpqHUeEkBVhNJ2jgTq5wWWdyWvkp+vILQ9ElDcTad0Qmy3mjQtgXoejSkgBiIQWZEY92aqInWW0IgfVlNwQEFCya3KbLEI6EgyW2F8iQI6sR4iL38KiYQ-LFg6A7h-dYi9djMAoBmOEL5pTUlwrs-xjqEj5XmNJMoiMeYiTyD5QG1T8C1L8DSWq3ILrjmlNyEm+BzBuIGqfbomI4UItqjsUAqKNLosdCCF5bzZBZydFECGoSYARLaY8PAdhP5oyeW7DoZ0JhEHBSIGOTMpxbgUIa4Y3YJhwz8DbHA2tuROGrPhf+-Fkoo2KVFRByCMCsLCDahWzg2BMDDa4QoH0LpLgsJfOkGJEDYmpYlShNV4L1Vls1So6AACaJZxrVEvoY-pMxlkWB4nAJALgPaG3KpkBBrQRAnMnIEQIec7rUWMcqWoaioJY0mBUHa0x6j4U3clbdQMQbCm6FC-WMLhgeC8AI1sR04FuFzOFeIDhZa8ykPzFjbi-7cweGdJcnDDrHSZYKJ0uddj9k1uDPF0TirnLwGIN8VH+iDHCB0aktawPcA1tEDQRB1m3C2eB9AxtQg+Qmcwa5HaijJime7Th8tva+0wl8boEICEOScuYLoDSuqfHwPgsMyZz0xkMq1MAlxkzYzE6J20mMrMN2OaULQNCjiJ2dHEbiXZJxKTIrqAacqvj-1Lc2Xw5t6iK0ApPNE1XwTMH+glv2MtPTenQPQdALi1HwAAPpEisAACgAJQAC50DwCW-AXABBcSXDG8QfY1B4AAG0AC6i3luUlzIQfgWKMZbeUQAOmWGYMAU3aAAB08BPcgLQebR3lvLau1imgv3bsXDPmN1g5jYCza+99+AJBKRnf2Ldt0dJHt0Bm7duMwBZvwAAHzwAAIwLah4T+AioH1KwwETuHM9-vneuwOMbQTZu0+YFIMbsBqGUn+Y92AH3IffZh5T8gBOicAEh1ubfO7Aa7NtVXQCm79mbkPIdi9+5LyC7PCgQ++8riX8AaDa+27drUGOAAMAAaeAABWY3CvvvylyY93bPPvsnYIL96HGl9fKKF4Tu3F1HtPdoLQeAABqAXIe6AB9N075bvuHu0H29Hpbsepue8oGjqOs2bfLaAA
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
