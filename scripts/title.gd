extends CanvasLayer

@onready var create_character_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/CreateCharacterButton
@onready var play_pazaak_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/PlayPazaakButton
@onready var exit_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/ExitButton
@onready var check_box: CheckBox = $MarginContainer/VBoxContainer/HBoxContainer/CheckBox

func _ready() -> void:
	create_character_button.pressed.connect(create_character)
	play_pazaak_button.pressed.connect(play_pazaak)
	exit_button.pressed.connect(exit)
	check_box.toggled.connect(on_check_box)
	
func create_character():
	get_tree().change_scene_to_file("res://scenes/character_creation.tscn")
	
func play_pazaak():
	get_tree().change_scene_to_file("res://scenes/pazaak.tscn")

func exit():
	get_tree().quit()

func on_check_box(toggled_on : bool):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
