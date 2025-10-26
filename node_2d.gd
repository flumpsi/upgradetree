extends Node2D

var tuff = 10000.0
var sixSeven = 0.0
var timePlayed = 0.0
var perSecondX = 1.0
var reset = false

func _process(dt):
	var tuffDisplay = get_node("TuffPointDisplay")
	var sixSevenDisplay = get_node("67PointDisplay")
	tuffDisplay.text = "Tuff: " + str(int(tuff))
	sixSevenDisplay.text = "67: " + str(sixSeven)

func _on_played_timeout() -> void:
	var lbl = get_node("TimePlayedDisplay")
	timePlayed += 1
	lbl.text = "Time Played: " + str(timePlayed)
