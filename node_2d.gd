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
	perSecondX = basePerSecondX * multiplier
	var suffixes = ["","K","M","B","T"]
	var i = 0
	var num = tuff
	while num >= 1000.0 and i < suffixes.size()-1:
		num/=1000.0
		i+=1
	var textTuff = str(floor(num*100+0.5)/100)
	if textTuff.ends_with(".0"):
		textTuff = textTuff.substr(0,textTuff.length()-2)
	textTuff += suffixes[i]
	tuffDisplay.text = "Tuff: " + textTuff # Also display text
	var i2 = 0
	var num2 = sixSeven
	while num2 >= 1000.0 and i2 < suffixes.size()-1:
		num2/=1000.0
		i2+=1
	var textSixSeven = str(floor(num2*100+0.5)/100)
	if textSixSeven.ends_with(".0"):
		textSixSeven = textSixSeven.substr(0,textSixSeven.length()-2)
	textSixSeven += suffixes[i2]
	sixSevenDisplay.text = "67: " + textSixSeven # Display text

"""func abbreviate_number(num: float) -> String:
	var suffixes = ["", "K", "M", "B", "T"]
	var i = 0
	while num >= 1000 and i < suffixes.size() - 1:
		num /= 1000.0
		i += 1
	num = floor(num * 100 + 0.5) / 100.0
	if tuff.ends_with(".0"):
		tuff = tuff.substr(0, tuff.length() - 2)
	return tuff + suffixes[i]"""


func _on_played_timeout() -> void:
	var lbl = get_node("TimePlayedDisplay")
	timePlayed += 1
	lbl.text = "Time Played: " + str(timePlayed)
