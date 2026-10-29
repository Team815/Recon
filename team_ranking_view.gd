extends VBoxContainer


func add_team(team_number: int) -> TeamNumberView:
	var team: TeamNumberView = preload("res://team_number_view.tscn").instantiate()
	team.number = team_number
	team.reordered.connect(_on_reordered)
	add_child(team)
	return team


func _on_reordered(dragged: TeamNumberView, dropped: TeamNumberView) -> void:
	print(dragged.number, " was dropped on ", dropped.number)
	move_child(dragged, dropped.get_index())
