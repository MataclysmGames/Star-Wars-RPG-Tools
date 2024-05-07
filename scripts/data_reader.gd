extends Node

var species_list : Array[CharacterInfo] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func read_species() -> Array[CharacterInfo]:
	if species_list.size() != 0:
		return species_list
	var species_list : Array[CharacterInfo] = []
	var file = FileAccess.open("res://data/species.txt", FileAccess.READ)
	if not file:
		printerr("Invalid species file")
		
	while !file.eof_reached():
		var line : PackedStringArray = file.get_csv_line()
		if line.size() != 9:
			var content : String = ",".join(line)
			if content != "":
				printerr("Invalid line: %s" % ",".join(line))
			continue
		var info : CharacterInfo = CharacterInfo.new()
		info.species = line[0]
		info.brawn = int(line[1])
		info.agility = int(line[2])
		info.intellect = int(line[3])
		info.cunning = int(line[4])
		info.willpower = int(line[5])
		info.presence = int(line[6])
		info.wound_threshold = int(line[7])
		info.strain_threshold = int(line[8])
		species_list.append(info)
	file.close()
	
	return species_list
