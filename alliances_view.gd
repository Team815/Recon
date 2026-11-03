extends GridContainer


var allied_teams: Array[TeamNumberView]


func _on_alliance_dropped(team: TeamNumberView, alliance: AllianceView) -> void:
	allied_teams.append(team)
	alliance.add_team(team)


func unally(team: TeamNumberView) -> void:
	team.alliance.remove_team(team.number)
	allied_teams.erase(team)
