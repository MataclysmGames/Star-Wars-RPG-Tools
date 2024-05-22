extends CanvasLayer

@onready var create_character_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/CreateCharacterButton
@onready var play_pazaak_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/PlayPazaakButton
@onready var exit_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/ExitButton

func _ready() -> void:
	DisplayServer.screen_set_orientation(DisplayServer.SCREEN_LANDSCAPE)
	create_character_button.pressed.connect(create_character)
	play_pazaak_button.pressed.connect(play_pazaak)
	exit_button.pressed.connect(exit)
	
func create_character():
	get_tree().change_scene_to_file("res://scenes/character_creation.tscn")
	
func play_pazaak():
	get_tree().change_scene_to_file("res://scenes/pazaak.tscn")

func exit():
	get_tree().quit()
