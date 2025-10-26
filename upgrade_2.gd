extends Button

var firsttime
var purchased
var price = 5

func _ready():
	firsttime = true

func _process(dt):
	if get_parent().reset == true:
		firsttime = true
		self.disabled = false

func _on_pressed() -> void:
	if firsttime == true and get_parent().tuff >= price:
		var timer = get_node("Timer")
		timer.start()
		firsttime = false
		purchased = true
		self.disabled = true
		get_parent().perSecondX *= 2
		print(get_parent().tuff)
		get_parent().tuff -=price
	else:
		print("poor")

""" Don't uncomment this please.
func _on_timer_timeout() -> void: 
	get_parent().perSecondX *= 2
	print(get_parent().tuff)
"""
