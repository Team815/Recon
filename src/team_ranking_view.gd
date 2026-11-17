extends VBoxContainer


func add_team(team_number: int) -> TeamNumberView:
	var team: TeamNumberView = preload("res://src/team_number_view.tscn").instantiate()
	team.number = team_number
	team.allied.connect(_on_team_allied)
	team.reordered.connect(_on_reordered)
	%Teams.add_child(team)
	return team


func _on_reordered(dragged: TeamNumberView, dropped: TeamNumberView) -> void:
	print(dragged.number, " was dropped on ", dropped.number)
	%Teams.move_child(dragged, dropped.get_index())


func _on_hide_allied_toggled(toggled_on: bool) -> void:
	for team: TeamNumberView in %Teams.get_children():
		_on_team_allied(team)


func _on_team_allied(team: TeamNumberView) -> void:
	team.visible = team.alliance == null or not %HideAllied.button_pressed
