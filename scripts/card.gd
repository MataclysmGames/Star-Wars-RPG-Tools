class_name Card
extends TextureRect

const red_color : Color = Color(1, 0.25, 0.25)
const blue_color : Color = Color(0.25, 0.25, 1)

@export var card_value : int = 0
@export var either_sign : bool = false

@onready var swap_button : Button = $SwapButton
@onready var play_button : Button = $PlayButton

var can_interact : bool = true

func _ready() -> void:
	set_value(card_value)
	if can_interact:
		if either_sign:
			swap_button.set_deferred("disabled", false)
			swap_button.show()
			swap_button.mouse_filter = Control.MOUSE_FILTER_STOP
			swap_button.pressed.connect(swap_sign)
	else:
		swap_button.queue_free()
		play_button.set_deferred("disabled", true)

func swap_sign():
	card_value = card_value * -1
	set_value(card_value)

func set_value(value : int):
	card_value = value
	var new_texture : GradientTexture2D = GradientTexture2D.new()
	new_texture.width = (texture as GradientTexture2D).width
	new_texture.height = (texture as GradientTexture2D).height
	new_texture.gradient = Gradient.new()
	if either_sign:
		new_texture.fill = GradientTexture2D.FILL_LINEAR
		new_texture.fill_from = Vector2(1, 0)
		new_texture.fill_to = Vector2(0, 1)
		new_texture.gradient.set_color(0, red_color if value > 0 else blue_color)
		new_texture.gradient.set_color(1, blue_color if value > 0 else red_color)
		new_texture.gradient.add_point(0.1, red_color if value > 0 else blue_color)
		new_texture.gradient.add_point(0.5, blue_color if value > 0 else red_color)
	else:
		new_texture.fill = GradientTexture2D.FILL_SQUARE
		new_texture.fill_from = Vector2(0.5, 0.5)
		new_texture.fill_to = Vector2(0.5, 0)
		new_texture.gradient.set_color(0, blue_color if value > 0 else red_color)
		new_texture.gradient.set_color(1, blue_color if value > 0 else red_color)
	texture = new_texture
	play_button.text = "%d" % [abs(card_value)]
