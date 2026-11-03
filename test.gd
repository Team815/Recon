extends Node


func _ready() -> void:
	for i in 40:
		add_team(i + 1)


func add_team(team_number: int) -> void:
	var team: TeamNumberView = %Teams.add_team(team_number)
	team.unallied.connect(%Alliances.unally)
