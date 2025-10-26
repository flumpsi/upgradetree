extends Button

var firsttime
var purchased
var price = 0.5

func _ready():
	firsttime = true



func _on_pressed() -> void:
	if firsttime == true and get_parent().sixSeven >= price:
		firsttime = false
		purchased = true
		self.disabled = true
		var timer = get_node("Timer")
		timer.start()
		get_parent().sixSeven -= price
	else:
		print("poor")

func _on_timer_timeout() -> void:
	# this doesn't work, don't uncomment
	# get_parent().perSecondX += get_parent().sixSeven
	
	# This works i guess
	get_parent().perSecondX = get_parent().basePerSecondX + (get_parent().sixSeven * get_parent().multiplier)
	# print("six seven: " + str(get_parent().perSecondX + get_parent().sixSeven))
	
