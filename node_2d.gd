extends Node2D

var tuff = 10000.0
var sixSeven = 10.0

var timePlayed = 0.0
var perSecondX = basePerSecondX
var perSecondXSixSeven = 1.0
var basePerSecondX = 1.0
var multiplier = 1.0
var reset = false

func _process(dt):
	var tuffDisplay = get_node("TuffPointDisplay") # Set variables for labels for easier access
	var sixSevenDisplay = get_node("67PointDisplay") # same here
	tuffDisplay.text = "Tuff: " + str(tuff) # Display text
	sixSevenDisplay.text = "67: " + str(sixSeven) # Also display text
	perSecondX = basePerSecondX * multiplier

func _on_played_timeout() -> void:
	var lbl = get_node("TimePlayedDisplay")
	timePlayed += 1
	lbl.text = "Time Played: " + str(timePlayed)
