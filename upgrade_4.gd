extends Button

var firsttime
var purchased
var timegive = 1000

func _ready():
	firsttime = true

func _process(dt):
	if get_parent().reset == true:
		firsttime = true
		self.disabled = false

func _on_pressed() -> void:
	if firsttime == true and get_parent().tuff >= timegive:
		var timer = get_node("Timer")
		timer.start()
		firsttime = false
		purchased = true # this currently does nothing
		self.disabled = true # disable button so it cannot be clicked anymore
		get_parent().sixSeven += (0.1*floor(get_parent().tuff / timegive)) * get_parent().perSecondXSixSeven
		get_parent().reset = true
		get_parent().perSecondX = 0
		get_parent().tuff = 0
		await get_tree().create_timer(0.1).timeout
		get_parent().reset = false
	else:
		print("poor")
