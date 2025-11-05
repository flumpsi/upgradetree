extends Button

var firsttime
var purchased
var price = 100

"""and get_parent().tuff >= int(get_node("Price").text)"""

func _ready():
	firsttime = true

func _process(dt):
	if get_parent().reset == true:
		var timer = get_node("Timer")
		timer.stop()
		firsttime = true
		self.disabled = false

func _on_pressed() -> void:
	if firsttime == true and get_parent().tuff >= price:
		var timer = get_node("Timer")
		timer.start()
		firsttime = false
		purchased = true # this currently does nothing
		self.disabled = true # disable button so it cannot be clicked anymore
		get_parent().tuff -=price
	else:
		print("poor")

func _on_timer_timeout() -> void:
	# note, ^ is ** in gdscript
	get_parent().gain2multiplier = (get_parent().tuff / 1000) # Use + for tuff boost itself math func. This is also a shit line of code, could be way better
	# get_parent().perSecondX *= min(get_parent().tuff ** 0.16, 1) # Or use * for tuff boost itself math func,
	# this one does nothing as result is just 1 and it is very self-explanatory what multiplication with 1x does.
	# get_parent().perSecondX *= get_parent().tuff ** 0.16 # You also have this one which just gives a insane amount of tuff.
	print("Boost itself with + " + str(min(get_parent().tuff ** 0.16, 1))) # Maybe this will be used for 67.
	print("Boost itself with * " + str(min(get_parent().tuff ** 0.16, 1)))
