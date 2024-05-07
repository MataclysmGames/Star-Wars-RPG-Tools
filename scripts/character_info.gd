class_name CharacterInfo
extends Node

var character_name : String = ""
var gender : String = "Male" # or "Female"
var species : String = ""
var career : String = ""
var specs : Array[String] = []
var obligation : String = ""
var motivation : String = ""

var brawn : int = 1
var agility : int = 1
var intellect : int = 1
var cunning : int = 1
var willpower : int = 1
var presence : int = 1

var wound_threshold : int = 1
var strain_threshold : int = 1
var soak_value : int = 1

# skill ranks
var astrogation : int = 0
var athletics : int = 0
var charm : int = 0
var coercion : int = 0
var computers : int = 0
var cool : int = 0
var coordination : int = 0
var deception : int = 0
var discipline : int = 0
var leadership : int = 0
var mechanics : int = 0
var medicine : int = 0
var negotiation : int = 0
var perception : int = 0
var piloting : int = 0
var resilience : int = 0
var skulduggery : int = 0
var stealth : int = 0
var streetwise : int = 0
var survival : int = 0
var vigilance : int = 0

var inventory : Array[String] = []
var talents : Array[String] = []

static func random() -> CharacterInfo:
	var ch = CharacterInfo.new()
	ch.gender = pick(["Male", "Female"])
	# pick species
	ch.species = pick(["Bothan", "Droid", "Gand", "Human", "Rodian", "Trandoshan", "Twi'lek", "Wookiee"])
	match ch.species:
		"Bothan":
			ch.character_name = pick(["Garc", "Nith", "Tramom", "Meenn"]) + " " + pick(["Gra'kit", "Gru'fas", "Sa'kus"])
			ch.brawn = 1
			ch.agility = 2
			ch.intellect = 2
			ch.cunning = 3
			ch.willpower = 2
			ch.presence = 2
			ch.wound_threshold = 10
			ch.strain_threshold = 11
		"Droid":
			ch.character_name = pick(["CT", "R4", "G7", "L1"]) + "-" + pick(["62", "PO", "D2"])
			ch.brawn = 1
			ch.agility = 1
			ch.intellect = 1
			ch.cunning = 1
			ch.willpower = 1
			ch.presence = 1
			# randomly pick between intelligent and military droid
			if randf_range(0, 1) >= 0.5:
				ch.brawn = 3
				ch.agility = 2
			else:
				ch.intellect = 3
				ch.presence = 2
			ch.wound_threshold = 10
			ch.strain_threshold = 10
		"Gand":
			ch.character_name = pick(["Teyk", "Rox", "Tosh", "Ax"]) + " " + pick(["Doclu", "Kaff", "Nerru"])
			ch.brawn = 2
			ch.agility = 2
			ch.intellect = 2
			ch.cunning = 2
			ch.willpower = 3
			ch.presence = 1
			ch.wound_threshold = 10
			ch.strain_threshold = 10
		"Human":
			ch.character_name = pick(["Hugh", "Harry", "Henry", "Hope"]) + " " + pick(["Kinpow", "Tancot", "Lovdra", "Jones", "Solo", "Smith"])
			ch.brawn = 2
			ch.agility = 2
			ch.intellect = 2
			ch.cunning = 2
			ch.willpower = 2
			ch.presence = 2
			ch.wound_threshold = 10
			ch.strain_threshold = 10
		"Rodian":
			ch.character_name = pick(["Clortt", "Shuhi", "Beesk", "Sparn"]) + " " + pick(["Cuggs", "Ghe", "Verme"])
			ch.brawn = 2
			ch.agility = 3
			ch.intellect = 2
			ch.cunning = 2
			ch.willpower = 1
			ch.presence = 2
			ch.wound_threshold = 10
			ch.strain_threshold = 10
		"Trandoshan":
			ch.character_name = pick(["Jorq", "Hart", "Kahk", "Bugg", "Assh"]) + " " + pick(["Gunlu", "Sasch", "Zurn"])
			ch.brawn = 3
			ch.agility = 1
			ch.intellect = 2
			ch.cunning = 2
			ch.willpower = 2
			ch.presence = 2
			ch.wound_threshold = 12
			ch.strain_threshold = 9
		"Twi'lek":
			ch.character_name = pick(["Jo", "Fab", "Les", "Chak", "Met", "Cin", "Ceb"]) + " " + pick(["Pell", "Fon", "Fi", "Gedki", "Modur", "Doh"])
			ch.brawn = 1
			ch.agility = 2
			ch.intellect = 2
			ch.cunning = 2
			ch.willpower = 2
			ch.presence = 3
			ch.wound_threshold = 10
			ch.strain_threshold = 11
		"Wookiee":
			ch.character_name = pick(["Spov", "Shiwu", "Rilna", "Purrsi", "Unmedde", "Dhitil"])
			ch.brawn = 3
			ch.agility = 2
			ch.intellect = 2
			ch.cunning = 2
			ch.willpower = 1
			ch.presence = 2
			ch.wound_threshold = 14
			ch.strain_threshold = 8
		_:
			ch.character_name = pick(["Freddy"]) + " " + pick(["Friday"])
	
	# pick career
	ch.career = pick(["Bounty Hunter", "Colonist", "Explorer", "Hired Gun", "Smuggler", "Technician"])
	
	# specialization
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
					ch.talents.append(pick(["Grit", "Stalker"]))
				"Gadgeteer":
					ch.mechanics += 1
					ch.talents.append(pick(["Toughened", "Point Blank"]))
				"Survivalist":
					ch.survival += 1
					ch.talents.append(pick(["Forager", "Swift"]))
		"Colonist":
			var spec : String = pick(["Doctor", "Politico", "Scholar"])
			ch.specs.append(spec)
			ch.charm += 1
			ch.leadership += 1
			ch.negotiation += 1
			match spec:
				"Doctor":
					ch.medicine += 1
					ch.talents.append(pick(["Grit", "Surgeon"]))
				"Politico":
					ch.coercion += 1
					ch.talents.append(pick(["Toughened", "Kill with Kindness"]))
				"Scholar":
					ch.perception += 1
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
					ch.talents.append(pick(["Street Smarts", "Galaxy Mapper"]))
				"Scout":
					ch.athletics += 1
					ch.talents.append(pick(["Rapid Recovery", "Grit"]))
				"Trader":
					ch.negotiation += 1
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
					ch.talents.append(pick(["Toughened", "Durable"]))
				"Marauder":
					ch.survival += 1
					ch.talents.append(pick(["Feral Strength", "Lethal Blows"]))
				"Mercenary":
					ch.discipline += 1
					ch.talents.append(pick(["Point Blank", "Second Wind"]))
		"Smuggler":
			var spec : String = pick(["Pilot", "Scoundrel", "Thief"])
			ch.specs.append(spec)
			ch.coordination += 1
			ch.piloting += 1
			ch.skulduggery += 1
			match spec:
				"Pilot":
					ch.astrogation += 1
					ch.talents.append(pick(["Galaxy Mapper", "Skilled Jockey"]))
				"Scoundrel":
					ch.charm += 1
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
	var chance : float = 0.93
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
	
	return ch
	
static func pick(options : Array[String]) -> String:
	return options.pick_random()
