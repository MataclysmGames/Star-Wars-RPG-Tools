extends CanvasLayer

@onready var button: Button = $MarginContainer/FullContainer/TopContainer/Button
@onready var main_container: HBoxContainer = $MarginContainer/FullContainer/MainContainer
@onready var inventory_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/InventoryValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(create_button_pressed)
	main_container.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_button_pressed():
	print("Hello")
	button.release_focus()
	inventory_value.text = "[ul]Blaster pistol with a silencer\nChewing gum[/ul]"
	main_container.show()
