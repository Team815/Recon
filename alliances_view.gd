extends GridContainer


var allied_teams: Dictionary[int, AllianceView]


func _on_alliance_dropped(team: TeamNumberView, alliance: AllianceView) -> void:
	if allied_teams.has(team.number):
		print("Team %d is already on an alliance" % team.number)
		return
	allied_teams[team.number] = alliance
	alliance.add_team(team.number)
	team.color = alliance.color
	team.show_unally_button()


func unally(team: int) -> void:
	print("Team %d is unallying" % team)
