extends Node


func _ready() -> void:
	add_team(815)
	add_team(123)
	add_team(67)
	add_team(2619)
	add_team(88888)

func add_team(team_number: int) -> void:
	var team: TeamNumberView = preload("res://team_number_view.tscn").instantiate()
	team.number = team_number
	%Teams.add_child(team)
