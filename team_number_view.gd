class_name TeamNumberView extends PanelContainer


var number: int:
	set(value):
		number = value
		%Number.text = str(number)

func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(duplicate())
	return number


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true


func _drop_data(at_position: Vector2, data: Variant) -> void:
	_drop_team(data)


func _drop_team(team_number: int) -> void:
	print(team_number, " was dropped on ", number)
	#var children = %Teams.get_children()
	#var dragged_team: TeamNumberView
	#for child: TeamNumberView in children:
		#if child.number == team_number:
			#dragged_team = child
			#break
	#%Teams.remove_child(dragged_team)
