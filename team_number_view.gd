class_name TeamNumberView extends PanelContainer


var number: int:
	set(value):
		number = value
		%Number.text = str(number)


signal reordered(dragged: TeamNumberView, dropped: TeamNumberView)


func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(duplicate())
	return self


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true


func _drop_data(at_position: Vector2, data: Variant) -> void:
	_drop_team(data)


func _drop_team(team: TeamNumberView) -> void:
	reordered.emit(team, self)
