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
var price = 50

func _ready():
	firsttime = true

func _process(dt):
	get_node("Purchased?").visible = not firsttime
	if get_parent().reset == true:
		firsttime = true
		self.disabled = false

func _on_pressed() -> void:
	if firsttime == true and get_parent().tuff >= price:
		var timer = get_node("Timer")
		timer.start()
		firsttime = false
		purchased = true # this currently does nothing
		self.disabled = true # disable button so it cannot be clicked anymore
		get_parent().multiplier *= 5
		print(get_parent().tuff)
		get_parent().tuff -=price
	else:
		print("poor")

""" Don't uncomment this please.
func _on_timer_timeout() -> void: 
	get_parent().perSecondX *= 2
	print(get_parent().tuff)
"""
