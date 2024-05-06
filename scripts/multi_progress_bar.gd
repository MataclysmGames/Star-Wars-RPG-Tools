@tool
class_name MultiProgressBar
extends ProgressBar

@export var primary_progress : int = 0
@export var secondary_progress : int = 0

@onready var second_progress_bar : ProgressBar = $SecondProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# temp randomness
	primary_progress = randi_range(1, 5)
	secondary_progress = randi_range(0, 2)
	
	show_percentage = false
	value = primary_progress
	
	second_progress_bar.global_position = global_position
	second_progress_bar.size = size
	second_progress_bar.value = secondary_progress

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = primary_progress
	
	second_progress_bar.global_position = global_position
	second_progress_bar.size = size
	second_progress_bar.value = secondary_progress
