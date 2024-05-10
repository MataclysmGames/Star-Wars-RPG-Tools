extends Node

var first_names : Array[String] = []
var last_names : Array[String] = []
var species_list : Array[CharacterInfo] = []

var file_cache : Dictionary = {} # [String, Array[String]]

func _init() -> void:
	first_names = read_lines("res://data/first_names.txt")
	last_names = read_lines("res://data/last_names.txt")
	read_species()

func read_lines(file_name : String) -> Array[String]:
	if file_cache.has(file_name):
		return file_cache[file_name]
	var file = FileAccess.open(file_name, FileAccess.READ)
	if not file:
		push_error("Invalid file name: '%s'" % file_name)
	var lines : Array[String] = []
	while !file.eof_reached():
		var line : String = file.get_line()
		if line:
			lines.append(line)
	file_cache[file_name] = lines
	return lines

func read_species() -> Array[CharacterInfo]:
	if species_list.size() != 0:
		return species_list
	species_list = []
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

func pick_random_species() -> CharacterInfo:
	var species : Array[CharacterInfo] = read_species()
	var pick : CharacterInfo = species.pick_random()
	var copy : CharacterInfo = CharacterInfo.new()
	copy.species = pick.species
	copy.brawn = pick.brawn
	copy.agility = pick.agility
	copy.intellect = pick.intellect
	copy.cunning = pick.cunning
	copy.willpower = pick.willpower
	copy.presence = pick.presence
	copy.wound_threshold = pick.wound_threshold
	copy.strain_threshold = pick.strain_threshold
	return copy

func pick_random_name() -> String:
	return first_names.pick_random() + " " + last_names.pick_random()
