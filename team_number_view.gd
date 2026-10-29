class_name TeamNumberView extends PanelContainer


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


signal reordered(dragged: TeamNumberView, dropped: TeamNumberView)
signal unally(team: int)


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
	color = Color.DIM_GRAY
	%UnallyButton.hide()
	unally.emit(number)


func show_unally_button() -> void:
	%UnallyButton.visible = true
