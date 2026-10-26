@tool
extends PanelContainer


@export var number: int:
	set(value):
		number = value
		if is_node_ready():
			%AllianceName.text = "A%d" % number


@export var color: Color:
	set(value):
		color = value
		var box: StyleBoxFlat = get_theme_stylebox("panel").duplicate()
		box.bg_color = color
		add_theme_stylebox_override("panel", box)


func _ready() -> void:
	number = number
