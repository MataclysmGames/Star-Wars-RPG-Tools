extends CanvasLayer

@onready var create_character_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/CreateCharacterButton
@onready var play_pazaak_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/PlayPazaakButton
@onready var exit_button: Button = $MarginContainer/VBoxContainer/VBoxContainer/ExitButton

func _ready() -> void:
	create_character_button.pressed.connect(create_character)
	play_pazaak_button.pressed.connect(play_pazaak)
	exit_button.pressed.connect(exit)
	
func create_character():
	get_tree().change_scene_to_file("res://scenes/character_creation.tscn")
	
func play_pazaak():
	print("Not implemented")

func exit():
	get_tree().quit()