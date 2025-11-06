extends Button

var giveTimes = 1.0

func _on_pressed() -> void:
	get_parent().adrenaline += giveTimes
