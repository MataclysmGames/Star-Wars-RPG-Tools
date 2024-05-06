@tool
class_name MultiProgressBar
extends ProgressBar

@export var primary_progress : int = 0
@export var secondary_progress : int = 0

@onready var second_progress_bar : ProgressBar = $SecondProgressBar

func _ready() -> void:
	show_percentage = false
	second_progress_bar.show_percentage = false

func _process(delta: float) -> void:
	second_progress_bar.global_position = global_position
	second_progress_bar.size = size

func set_progress(value1 : int, value2 : int):
	var mx : int = max(value1, value2)
	var mn : int = min(value1, value2)
	value = mx
	second_progress_bar.value = mn
	
	second_progress_bar.global_position = global_position
	second_progress_bar.size = size
