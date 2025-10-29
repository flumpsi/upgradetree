extends Button

var firsttime
var purchased
var price = 10

func _ready():
	firsttime = true

func _on_pressed() -> void:
	if firsttime == true and get_parent().sixSeven >= price:
		firsttime = false
		purchased = true # this currently does nothing
		self.disabled = true # disable button so it cannot be clicked anymore
		get_parent().perSecondXSixSeven = 2.0
		get_parent().sixSeven -= price
	else:
		print("poor")
