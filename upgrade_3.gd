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

extends Button

var firsttime
var purchased
var price = 100

"""and get_parent().tuff >= int(get_node("Price").text)"""

func _ready():
	firsttime = true

func _process(dt):
	get_node("Purchased?").visible = not firsttime
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
	get_parent().gain2multiplier = (get_parent().tuff / 5000) # Use + for tuff boost itself math func. This is also a shit line of code, could be way better
	# get_parent().perSecondX *= min(get_parent().tuff ** 0.16, 1) # Or use * for tuff boost itself math func,
	# this one does nothing as result is just 1 and it is very self-explanatory what multiplication with 1x does.
	# get_parent().perSecondX *= get_parent().tuff ** 0.16 # You also have this one which just gives a insane amount of tuff.
	print("Boost itself with + " + str(min(get_parent().tuff ** 0.16, 1))) # Maybe this will be used for 67.
	print("Boost itself with * " + str(min(get_parent().tuff ** 0.16, 1)))
