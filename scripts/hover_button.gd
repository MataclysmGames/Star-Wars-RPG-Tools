extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_hovered() and disabled:
		release_focus()
	if is_hovered() and not disabled:
		grab_focus()
