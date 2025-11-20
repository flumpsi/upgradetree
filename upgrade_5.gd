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
var price = 0.5

func _ready():
	firsttime = true

func _process(dt):
	get_node("Purchased?").visible = not firsttime

func _on_pressed() -> void:
	if firsttime == true and get_parent().sixSeven >= price:
		firsttime = false
		purchased = true # this currently does nothing
		self.disabled = true # disable button so it cannot be clicked anymore
		var timer = get_node("Timer")
		timer.start()
		get_parent().sixSeven -= price
	else:
		print("poor")

func _on_timer_timeout() -> void:
	# this doesn't work, don't uncomment
	# get_parent().perSecondX += get_parent().sixSeven
	
	# This works i guess
	get_parent().multiplierSixSeven += (get_parent().sixSeven / 1000)
	# print("six seven: " + str(get_parent().perSecondX + get_parent().sixSeven))
	
