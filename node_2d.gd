# Copyright (C) 2025 flumpsi

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

extends Node2D

var tuff = 0.0
var sixSeven = 0.0
var adrenaline = 0.0

var timePlayed = 0
var cheated = false
var perSecondX = basePerSecondX
var perSecondXSixSeven = 1.0
var basePerSecondX = 1.0
var multiplier = 1.0
var multiplierSixSeven = 1.0
var multiplierDopamine = 1.0
var gain2multiplier = 1.0
var reset = false

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_Z:
			tuff += 100000
			sixSeven += 100000
			adrenaline += 100000
			cheated = true
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _process(dt):
	var timeStr = "%d:%02d:%02d" % [timePlayed/3600, (timePlayed/60)%60, timePlayed%60]
	var tuffDisplay = get_node("TuffPointDisplay") # Set variables for labels for easier access
	var sixSevenDisplay = get_node("67PointDisplay") # same here
	var adrenalineDisplay = get_node("AdrenalinePointDisplay") # same here
	var timeWasDisplay = get_node("timeWas")
	perSecondX = basePerSecondX * gain2multiplier * multiplierSixSeven * multiplierDopamine * multiplier
	var suffixes = ["","K","M","B","T","Qa","Qn","Sx","Sp","Oc","No","De","Ude","DDe","TDe","QDe","QnDe","SxDe","SpDe","OcDe","NoDe","Vg","UVg","DVg","TVg","QVg","QnVg","SxVg","SpVg","OcVg", "NoVg","Tg","UTg", "DTg", "TTg", "QTg", "QnTg", "SxTg", "SpTg", "OcTg", "NoTg",
"Qd", "UQd","DQd","TQd","QQd","QnQd","SxQd","SpQd","OcQd","NoQd", "QnD", "UQnD", "DQnD", "TQnD", "QQnD", "QnQnD", "SxQnD", "SpQnD", "OcQnD", "NoQnD",
"SxD", "USxD", "DSxD", "TSxD", "QSxD", "QnSxD", "SxSxD", "SpSxD", "OcSxD", "NoSxD",
"SpD", "USpD", "DSpD", "TSpD", "QSpD", "QnSpD", "SxSpD", "SpSpD", "OcSpD", "NoSpD",
"OcD", "UOcD", "DOcD", "TOcD", "QOcD", "QnOcD", "SxOcD", "SpOcD", "OcOcD", "NoOcD",
"NoD", "UNoD", "DNoD", "TNoD", "QNoD", "QnNoD", "SxNoD", "SpNoD", "OcNoD", "NoNoD"]
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
	var i3 = 0
	var num3 = adrenaline
	while num3 >= 1000.0 and i3 < suffixes.size()-1:
		num3/=1000.0
		i3+=1
	var textAdrenaline = str(floor(num3*100+0.5)/100)
	if textAdrenaline.ends_with(".0"):
		textAdrenaline = textAdrenaline.substr(0,textAdrenaline.length()-2)
	textAdrenaline += suffixes[i3]
	adrenalineDisplay.text = "Dopamine: " + textAdrenaline # Display text
	timeWasDisplay.text = "Your time was: " + timeStr
	

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
