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
var timegive = 1000

func _ready():
	firsttime = true
	self.visible = false

func _process(dt):
	get_node("Purchased?").visible = not firsttime
	if get_parent().get_node("Upgrade3").firsttime == false:
		self.visible = true
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
