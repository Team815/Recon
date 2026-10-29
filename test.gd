extends Node


func _ready() -> void:
	add_team(815)
	add_team(123)
	add_team(67)
	add_team(2619)
	add_team(88888)


func add_team(team_number: int) -> void:
	var team: TeamNumberView = %Teams.add_team(team_number)
	team.unally.connect(%Alliances.unally)
