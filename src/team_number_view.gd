class_name TeamNumberView extends PanelContainer


signal reordered(dragged: TeamNumberView, dropped: TeamNumberView)
signal allied(team: TeamNumberView)
signal unallied(team: TeamNumberView)


var number: int:
	set(value):
		number = value
		%Number.text = str(number)


var color: Color:
	set(value):
		color = value
		var box: StyleBoxFlat = get_theme_stylebox("panel").duplicate()
		box.bg_color = color
		add_theme_stylebox_override("panel", box)


var alliance: AllianceView:
	set(value):
		alliance = value
		if alliance != null:
			color = alliance.color
			%UnallyButton.show()
			allied.emit(self)
		else:
			remove_theme_stylebox_override("panel")
			%UnallyButton.hide()


func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(duplicate())
	return self


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true


func _drop_data(at_position: Vector2, data: Variant) -> void:
	_drop_team(data)


func _drop_team(team: TeamNumberView) -> void:
	reordered.emit(team, self)


func _on_unally_button_pressed() -> void:
	unallied.emit(self)
	alliance = null
