@tool
class_name AllianceView extends PanelContainer


signal dropped(team: TeamNumberView, alliance: AllianceView)


@export var number: int:
	set(value):
		number = value
		%AllianceName.text = "A%d" % number


@export var color: Color:
	set(value):
		color = value
		var box: StyleBoxFlat = get_theme_stylebox("panel").duplicate()
		box.bg_color = color
		add_theme_stylebox_override("panel", box)


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is TeamNumberView and _can_drop_team(data)


func _can_drop_team(team: TeamNumberView) -> bool:
	return team.alliance == null


func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is TeamNumberView:
		_drop_team(data)


func _drop_team(team: TeamNumberView) -> void:
	dropped.emit(team, self)


func add_team(team: TeamNumberView) -> void:
	team.alliance = self
	var team_label := Label.new()
	team_label.text = str(team.number)
	%Teams.add_child(team_label)


func remove_team(team: int) -> void:
	var team_text = str(team)
	for team_label: Label in %Teams.get_children():
		if team_text == team_label.text:
			%Teams.remove_child(team_label)
			team_label.queue_free()
