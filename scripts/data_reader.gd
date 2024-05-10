extends Node

var species_list : Array[CharacterInfo] = []

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
