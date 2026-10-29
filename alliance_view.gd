@tool
class_name AllianceView extends PanelContainer


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


signal dropped(team: TeamNumberView, alliance: AllianceView)


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true


func _drop_data(at_position: Vector2, data: Variant) -> void:
	_drop_team(data)


func _drop_team(team: TeamNumberView) -> void:
	dropped.emit(team, self)


func add_team(team: int) -> void:
	var team_label := Label.new()
	team_label.text = str(team)
	%Teams.add_child(team_label)
