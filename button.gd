extends Button

var firsttime
var purchased

func _ready():
	firsttime = true

func _process(dt):
	if get_parent().reset == true:
		firsttime = true
		self.disabled = false

func _on_pressed() -> void:
	if firsttime == true:
		var timer = get_node("Timer")
		timer.start()
		get_parent().perSecondX = 1.0
		firsttime = false
		purchased = true
		self.disabled = true


func _on_timer_timeout() -> void:
	get_parent().tuff += get_parent().perSecondX
	print("perSecondX: " + str(get_parent().perSecondX))
	print(get_parent().tuff)
