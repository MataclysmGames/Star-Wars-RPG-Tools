class_name CharacterGenerator

const COMMON_SPECIES : Array[String] = ["Bothan", "Droid", "Gand", "Human", "Rodian", "Trandoshan", "Twi'lek", "Wookiee"]

static func common_random() -> CharacterInfo:
	var ch : CharacterInfo = DataReader.pick_acceptable_species(COMMON_SPECIES, true)
	return populate(ch)

static func exotic_random() -> CharacterInfo:
	var ch : CharacterInfo = DataReader.pick_acceptable_species(COMMON_SPECIES, false)
	return populate(ch)

static func random() -> CharacterInfo:
	var ch : CharacterInfo = DataReader.pick_random_species()
	return populate(ch)

static func populate(ch : CharacterInfo) -> CharacterInfo:
	ch.gender = pick(["Male", "Female"])
	var species_names_file : String = "res://data/%s_names.txt" % ch.species.to_lower()
	if FileAccess.file_exists(species_names_file):
		ch.character_name = DataReader.read_lines(species_names_file).pick_random()
	else:
		ch.character_name = DataReader.pick_random_name()
	
	ch.career = pick(["Bounty Hunter", "Colonist", "Explorer", "Hired Gun", "Smuggler", "Technician"])
	match ch.career:
		"Bounty Hunter":
			var spec : String = pick(["Assassin", "Gadgeteer", "Survivalist"])
			ch.specs.append(spec)
			ch.perception += 1
			ch.streetwise += 1
			ch.vigilance += 1
			match spec:
				"Assassin":
					ch.stealth += 1
					ch.melee += 1
					ch.talents.append(pick(["Grit", "Stalker"]))
				"Gadgeteer":
					ch.mechanics += 1
					ch.brawl += 1
					ch.talents.append(pick(["Toughened", "Point Blank"]))
				"Survivalist":
					ch.survival += 1
					ch.brawl += 1
					ch.talents.append(pick(["Forager", "Swift"]))
		"Colonist":
			var spec : String = pick(["Doctor", "Politico", "Scholar"])
			ch.specs.append(spec)
			ch.charm += 1
			ch.leadership += 1
			ch.negotiation += 1
			match spec:
				"Doctor":
					ch.medicine += 2
					ch.talents.append(pick(["Grit", "Surgeon"]))
				"Politico":
					ch.coercion += 2
					ch.talents.append(pick(["Toughened", "Kill with Kindness"]))
				"Scholar":
					ch.leadership += 1
					ch.charm += 1
					ch.talents.append(pick(["Respected Scholar", "Speaks Binary"]))
		"Explorer":
			var spec : String = pick(["Fringer", "Scout", "Trader"])
			ch.specs.append(spec)
			ch.cool += 1
			ch.perception += 1
			ch.piloting += 1
			match spec:
				"Fringer":
					ch.astrogation += 1
					ch.streetwise += 1
					ch.talents.append(pick(["Street Smarts", "Galaxy Mapper"]))
				"Scout":
					ch.athletics += 1
					ch.survival += 1
					ch.talents.append(pick(["Rapid Recovery", "Grit"]))
				"Trader":
					ch.negotiation += 2
					ch.talents.append(pick(["Wheel and Deal", "Smooth Talker"]))
		"Hired Gun":
			var spec : String = pick(["Bodyguard", "Marauder", "Mercenary"])
			ch.specs.append(spec)
			ch.resilience += 1
			ch.vigilance += 1
			ch.athletics += 1
			match spec:
				"Bodyguard":
					ch.perception += 1
					ch.brawl += 1
					ch.ranged_heavy += 1
					ch.talents.append(pick(["Toughened", "Durable"]))
				"Marauder":
					ch.survival += 1
					ch.brawl += 1
					ch.ranged_light += 1
					ch.talents.append(pick(["Feral Strength", "Lethal Blows"]))
				"Mercenary":
					ch.discipline += 1
					ch.brawl += 1
					ch.gunnery += 1
					ch.talents.append(pick(["Point Blank", "Second Wind"]))
		"Smuggler":
			var spec : String = pick(["Pilot", "Scoundrel", "Thief"])
			ch.specs.append(spec)
			ch.coordination += 1
			ch.piloting += 1
			ch.skulduggery += 1
			ch.gunnery += 1
			match spec:
				"Pilot":
					ch.astrogation += 1
					ch.talents.append(pick(["Galaxy Mapper", "Skilled Jockey"]))
				"Scoundrel":
					ch.charm += 1
					ch.ranged_light += 1
					ch.talents.append(pick(["Convincing Demeanor", "Quick Draw"]))
				"Thief":
					ch.computers += 1
					ch.talents.append(pick(["Street Smarts", "Grit"]))
		"Technician":
			var spec : String = pick(["Mechanic", "Outlaw", "Slicer"])
			ch.specs.append(spec)
			ch.mechanics += 1
			ch.computers += 1
			ch.astrogation += 1
			match spec:
				"Mechanic":
					ch.piloting += 1
					ch.brawl += 1
					ch.talents.append(pick(["Solid Repairs", "Fine Tuning"]))
				"Outlaw":
					ch.streetwise += 1
					ch.talents.append(pick(["Utinni!", "Tinkerer"]))
				"Slicer":
					ch.stealth += 1
					ch.talents.append(pick(["Technical Aptitude", "Codebreaker"]))
	
	# obligation
	ch.obligation = pick(["Addiction", "Betrayal", "Blackmail", "Bounty", "Criminal", "Debt", "Dutybound", "Family", "Oath", "Obsession", "Responsibility"])
	
	# motivation
	ch.motivation = pick(["Friendship", "Love", "Freedom", "Fame", "Greed", "Status", "Expertise", "Wanderlust", "Power", "Religion", "Charity", "Non-Human Rights", "Local Politics", "Overthrow the Empire", "Crime", "Emancipation", "Droid Rights", "Capitalism", "Support the Empire", "Place of Origin", "Pet", "Childhood Friend", "Comrades", "Siblings", "Mentor", "Parents", "Extended Family", "Droid Companion", "Former Nemesis"])
	
	# add random skills
	var chance : float = 0.90
	ch.astrogation += 0 if randf_range(0, 1) <= chance else 1
	ch.athletics += 0 if randf_range(0, 1) <= chance else 1
	ch.charm += 0 if randf_range(0, 1) <= chance else 1
	ch.coercion += 0 if randf_range(0, 1) <= chance else 1
	ch.computers += 0 if randf_range(0, 1) <= chance else 1
	ch.cool += 0 if randf_range(0, 1) <= chance else 1
	ch.coordination += 0 if randf_range(0, 1) <= chance else 1
	ch.deception += 0 if randf_range(0, 1) <= chance else 1
	ch.discipline += 0 if randf_range(0, 1) <= chance else 1
	ch.leadership += 0 if randf_range(0, 1) <= chance else 1
	ch.mechanics += 0 if randf_range(0, 1) <= chance else 1
	ch.medicine += 0 if randf_range(0, 1) <= chance else 1
	ch.negotiation += 0 if randf_range(0, 1) <= chance else 1
	ch.perception += 0 if randf_range(0, 1) <= chance else 1
	ch.piloting += 0 if randf_range(0, 1) <= chance else 1
	ch.resilience += 0 if randf_range(0, 1) <= chance else 1
	ch.skulduggery += 0 if randf_range(0, 1) <= chance else 1
	ch.stealth += 0 if randf_range(0, 1) <= chance else 1
	ch.streetwise += 0 if randf_range(0, 1) <= chance else 1
	ch.survival += 0 if randf_range(0, 1) <= chance else 1
	ch.vigilance += 0 if randf_range(0, 1) <= chance else 1
	ch.brawl += 0 if randf_range(0, 1) <= chance else 1
	ch.gunnery += 0 if randf_range(0, 1) <= chance else 1
	ch.melee += 0 if randf_range(0, 1) <= chance else 1
	ch.ranged_light += 0 if randf_range(0, 1) <= chance else 1
	ch.ranged_heavy += 0 if randf_range(0, 1) <= chance else 1
	
	# add 1 to a random characteristic
	var idx : int = randi_range(1, 6)
	match idx:
		1:
			ch.brawn += 1
		2:
			ch.agility += 1
		3:
			ch.intellect += 1
		4:
			ch.cunning += 1
		5:
			ch.willpower += 1
		6:
			ch.presence += 1
	
	# random normal items
	ch.inventory.append("[color=green]%d credits[/color]" % [randi_range(5, 30) * 10])
	ch.inventory.append(pick(["Normal Clothing", "Heavy Clothing", "Padded Armor"]))
	ch.inventory.append(pick(["Stimpack", "Binders", "Hand Scanner"]))
	ch.inventory.append(pick(["Comlink (handheld)", "Comlink (long range)", "Medpac"]))
	ch.inventory.append(pick(["Glow Rod", "Datapad"]))
	
	# chance for a rare/expensive/illegal item
	if randf_range(0, 1) >= 0.90:
		ch.inventory.append("[color=red]%s[/color]" % pick(["Death sticks (1 dose)", "Glitterstim (1 dose)", "Lesai (1 dose)"]))
	if randf_range(0, 1) >= 0.95:
		ch.inventory.append("[color=purple]%s[/color]" % pick(["Jet Pack", "Data Breaker", "Personal Stealth Field"]))
	if randf_range(0, 1) >= 0.99:
		ch.inventory.append("[color=yellow]%s[/color]" % pick(["Broken Lightsaber", "Pumpkin Bumpkin Chumplins"]))
	
	ch.wound_threshold += ch.brawn
	ch.strain_threshold += ch.willpower
	ch.soak_value = ch.brawn
	if ch.inventory.has("Heavy Clothing"):
		ch.soak_value += 1
	elif ch.inventory.has("Padded Armor"):
		ch.soak_value += 2
	
	if ch.talents.has("Grit"):
		ch.strain_threshold += 1
	if ch.talents.has("Toughened"):
		ch.wound_threshold += 2
	
	# Disposition
	ch.disposition = DataReader.pick_random_dispositions(randi_range(1, 2))
	
	# Available quests
	ch.available_quests = DataReader.pick_random_quests(randi_range(-2, 2))
	
	return ch
	
static func pick(options : Array[String]) -> String:
	return options.pick_random()
