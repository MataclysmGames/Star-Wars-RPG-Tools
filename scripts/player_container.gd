class_name PlayerContainer
extends PanelContainer

signal win()
signal lose()
signal stand()

@export var player_name : String = "Player"
@export var hide_hand : bool = false
@export var controllable : bool = true
@export var card_direction : LayoutDirection = LAYOUT_DIRECTION_LTR

@onready var name_label: Label = $VBoxContainer/InfoContainer/NameLabel
@onready var score_label : Label = $VBoxContainer/InfoContainer/ScoreLabel
@onready var grid_container : GridContainer = $VBoxContainer/MarginContainer/GridContainer
@onready var hand_label : Label = $VBoxContainer/HandLabel
@onready var hand_container : HBoxContainer = $VBoxContainer/HandMarginContainer/HandContainer

@onready var overlay : ColorRect = $Overlay

var card_scene : PackedScene = preload("res://scenes/card.tscn")

func _ready() -> void:
	name_label.text = player_name
	hand_label.text = "%s's Hand" % player_name
	grid_container.layout_direction = card_direction
	hand_container.layout_direction = card_direction
	evaluate_score()
	for i in range(4):
		var card : Card = card_scene.instantiate() as Card
		card.either_sign = randf_range(0, 1) <= 0.25
		card.card_value = randi_range(1, 5) * 1 if randf_range(0, 1) <= 0.5 else -1
		card.modulate = Color(0, 0, 0, 1) if hide_hand else Color(1, 1, 1, 1)
		add_card_to_hand(card)

func show_overlay():
	overlay.show()

func hide_overlay():
	overlay.hide()

func move_card_from_hand_to_grid(card : Card):
	if card.swap_button and not card.swap_button.is_queued_for_deletion():
		card.swap_button.hide()
	card.play_button.set_deferred("disabled", true)
	card.modulate = Color(1, 1, 1, 1)
	hand_container.remove_child(card)
	add_card_to_grid(card)

func add_card_to_hand(card : Card):
	hand_container.add_child(card)
	if controllable:
		card.play_button.pressed.connect(move_card_from_hand_to_grid.bind(card))
	else:
		card.play_button.set_deferred("disabled", true)
		card.swap_button.set_deferred("disabled", true)

func add_card_to_grid(card : Card):
	grid_container.add_child(card)
	evaluate_score()

func evaluate_score() -> int:
	var score : int = 0
	for child in grid_container.get_children():
		if child is Card:
			score += child.card_value
	score_label.text = "Score: %d" % [score]
	
	if score >= 20:
		print("Score: %d" % score)
		stand.emit()
	
	if grid_container.get_child_count() >= 9:
		stand.emit()
	
	return score
