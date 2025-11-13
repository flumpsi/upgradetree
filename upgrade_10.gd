extends Button

var firsttime
var purchased
var price = 100

func _ready():
	firsttime = true
	

func _on_pressed() -> void:
	if firsttime == true and get_parent().sixSeven >= price:
		firsttime = false
		purchased = true # this currently does nothing
		self.disabled = true # disable button so it cannot be clicked anymore
		get_parent().multiplierDopamine += log(67)
		get_parent().sixSeven -= price
	else:
		print("poor")

func _on_timer_timeout() -> void:
	# this doesn't work, don't uncomment
	# get_parent().perSecondX += get_parent().sixSeven
	
	# This works i guess
	get_parent().multiplier += (get_parent().sixSeven / 1000)
	# print("six seven: " + str(get_parent().perSecondX + get_parent().sixSeven))
	
