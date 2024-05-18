class_name Pazaak
extends CanvasLayer

signal player_end_turn()

@onready var back_button : Button = $MarginContainer/VBoxContainer/TopContainer/BackButton
@onready var player_container : PlayerContainer = $MarginContainer/VBoxContainer/BoardContainer/PlayerContainer
@onready var opponent_container : PlayerContainer = $MarginContainer/VBoxContainer/BoardContainer/OpponentContainer

@onready var stand_button : Button = $MarginContainer/VBoxContainer/BoardContainer/MiddleContainer/StandButton
@onready var end_turn_button : Button = $MarginContainer/VBoxContainer/BoardContainer/MiddleContainer/EndTurnButton

const WAIT_TIME : float = 0.5

var card_scene : PackedScene = preload("res://scenes/card.tscn")

var shared_deck : Array[int]
var deck_index : int = 0

var player_stand : bool = false
var opponent_stand : bool = false
var round_over : bool = false

var player_rounds_won : int = 0
var opponent_rounds_won : int = 0

func _ready() -> void:
	back_button.pressed.connect(back_to_title)
	
	stand_button.pressed.connect(on_player_stand)
	end_turn_button.pressed.connect(on_player_end_turn)
	
	player_container.win.connect(player_win)
	player_container.lose.connect(opponent_win)
	player_container.stand.connect(on_player_stand)
	opponent_container.win.connect(opponent_win)
	opponent_container.lose.connect(player_win)
	opponent_container.stand.connect(on_opponent_stand)
	
	for i in range(5, 55):
		var val : int = (i / 5)
		shared_deck.append(val)
	shared_deck.shuffle()
	play_game()
	
func back_to_title():
	get_tree().change_scene_to_file("res://scenes/title.tscn")
	
func player_win():
	player_rounds_won += 1
	print("Player win")
	end_round()

func opponent_win():
	opponent_rounds_won += 1
	print("Opponent win")
	end_round()

func on_player_stand():
	player_stand = true
	player_end_turn.emit()

func on_opponent_stand():
	opponent_stand = true

func on_player_end_turn():
	player_end_turn.emit()
	
func play_game():
	create_tween().tween_callback(game_round)

func game_round():
	if player_stand and opponent_stand:
		end_round()
		return
		
	if not round_over and not player_stand:
		await start_player_round()
		await player_end_turn
	if not round_over and not opponent_stand:
		await start_opponent_round()
		auto_play(player_container, opponent_container)
	if not round_over:
		play_game()

func round_is_over():
	pass

func end_round():
	print("End")
	opponent_container.show_overlay()
	player_container.show_overlay()
	var tween : Tween = create_tween()
	tween.tween_interval(2.0)
	tween.tween_callback(func(): get_tree().reload_current_scene())

func start_player_round():
	stand_button.set_deferred("disabled", false)
	end_turn_button.set_deferred("disabled", false)
	
	var tween : Tween = create_tween()
	tween.tween_callback(func(): opponent_container.show_overlay())
	tween.tween_interval(WAIT_TIME)
	tween.tween_callback(func(): player_container.hide_overlay())
	tween.tween_interval(WAIT_TIME)
	tween.tween_callback(func(): player_container.add_card_to_grid(next_card()))
	tween.tween_interval(WAIT_TIME)
	await tween.finished

func start_opponent_round():
	stand_button.set_deferred("disabled", true)
	end_turn_button.set_deferred("disabled", true)
	
	var tween : Tween = create_tween()
	tween.tween_callback(func(): player_container.show_overlay())
	tween.tween_interval(WAIT_TIME)
	tween.tween_callback(func(): opponent_container.hide_overlay())
	tween.tween_interval(WAIT_TIME)
	tween.tween_callback(func(): opponent_container.add_card_to_grid(next_card()))
	tween.tween_interval(WAIT_TIME)
	await tween.finished

func auto_play(player : PlayerContainer, opponent : PlayerContainer):
	var player_score : int = player.evaluate_score()
	var opponent_score : int = opponent.evaluate_score()
	if opponent_score > 20:
		return
		
	if opponent_score >= player_score and player_stand:
		opponent_stand = true
		return
	
	if not player_stand:
		var best_hand_card : Card = null
		var best_hand_value : int = 15
		for child in opponent_container.hand_container.get_children():
			if child is Card:
				var resulting_score : int = opponent_score + child.card_value
				if resulting_score <= 20 and resulting_score > best_hand_value:
					best_hand_value = resulting_score
					best_hand_card = child as Card
		if best_hand_card:
			opponent_container.move_card_from_hand_to_grid(best_hand_card)
			opponent_score += best_hand_value
			if opponent_score >= 18 and opponent_score >= player_score:
				opponent_stand = true
	
func next_card() -> Card:
	var next_card_value : int = shared_deck[deck_index]
	deck_index += 1
	var card : Card = card_scene.instantiate() as Card
	card.card_value = next_card_value
	card.can_interact = false
	return card
