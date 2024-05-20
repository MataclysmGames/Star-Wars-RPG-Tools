extends CanvasLayer

@onready var back_button: Button = $MarginContainer/FullContainer/TopContainer/BackButton
@onready var randomize_button: Button = $MarginContainer/FullContainer/TopContainer/RandomizeButton
@onready var main_container: HBoxContainer = $MarginContainer/FullContainer/MainContainer

@onready var profile: TextureRect = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/Profile
@onready var name_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/NameLabel

@onready var species_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/InfoGrid/SpeciesValue
@onready var career_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/InfoGrid/CareerValue
@onready var specs_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/InfoGrid/SpecsValue
@onready var obligation_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/InfoGrid/ObligationValue
@onready var motivation_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/InfoGrid/MotivationValue

@onready var soak_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/StatsGrid/SoakValue
@onready var wound_threshold_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/StatsGrid/WoundThresholdValue
@onready var strain_threshold_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/StatsGrid/StrainThresholdValue

@onready var brawn_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/CharacteristicsGrid/BrawnValue
@onready var agility_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/CharacteristicsGrid/AgilityValue
@onready var intellect_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/CharacteristicsGrid/IntellectValue
@onready var cunning_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/CharacteristicsGrid/CunningValue
@onready var willpower_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/CharacteristicsGrid/WillpowerValue
@onready var presence_value: Label = $MarginContainer/FullContainer/MainContainer/InfoContainer/MarginContainer/CharacterContainer/CharacteristicsGrid/PresenceValue

@onready var astrogation_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/AstrogationBar
@onready var athletics_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/AthleticsBar
@onready var charm_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/CharmBar
@onready var coercion_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/CoercionBar
@onready var computers_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/ComputersBar
@onready var cool_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/CoolBar
@onready var coordination_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/CoordinationBar
@onready var deception_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/DeceptionBar
@onready var discipline_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/DisciplineBar
@onready var leadership_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/LeadershipBar
@onready var mechanics_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/MechanicsBar
@onready var medicine_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/MedicineBar
@onready var negotiation_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/NegotiationBar
@onready var perception_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/PerceptionBar
@onready var piloting_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/PilotingBar
@onready var resilience_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/ResilienceBar
@onready var skulduggery_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/SkulduggeryBar
@onready var stealth_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/StealthBar
@onready var streetwise_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/StreetwiseBar
@onready var survival_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/SurvivalBar
@onready var vigilance_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/VigilanceBar

@onready var brawl_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/BrawlBar
@onready var gunnery_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/GunneryBar
@onready var melee_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/MeleeBar
@onready var ranged_light_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/RangedLightBar
@onready var ranged_heavy_bar: MultiProgressBar = $MarginContainer/FullContainer/MainContainer/SkillsContainer/MarginContainer/CharacteristicsContainer/SkillsGridContainer/RangedHeavyBar

@onready var inventory_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/TopContainer/InventoryValue
@onready var talents_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/TopContainer/TalentsValue

@onready var disposition_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/BottomContainer/DispositionValue
@onready var available_quests_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/BottomContainer/AvailableQuestsValue

func _ready() -> void:
	randomize_button.pressed.connect(create_button_pressed)
	back_button.pressed.connect(back_to_title)
	main_container.hide()
	create_button_pressed()

func back_to_title():
	get_tree().change_scene_to_file("res://scenes/title.tscn")

func create_button_pressed():
	randomize_button.release_focus()
	var character : CharacterInfo = CharacterInfo.random()
	
	var profile_load_list : Array[String] = [
		"res://assets/%s-%s.png" % [character.species.to_lower(), character.gender.to_lower()],
		"res://assets/%s.png" % [character.species.to_lower()],
		"res://assets/default.png"
	]
	
	for resource in profile_load_list:
		if ResourceLoader.exists(resource):
			profile.texture = load(resource)
			break
	
	name_value.text = character.character_name
	species_value.text = character.species
	career_value.text = character.career
	specs_value.text = ", ".join(character.specs)
	obligation_value.text = character.obligation
	motivation_value.text = character.motivation
	
	soak_value.text = str(character.soak_value)
	wound_threshold_value.text = str(character.wound_threshold)
	strain_threshold_value.text = str(character.strain_threshold)
	
	brawn_value.text = str(character.brawn)
	agility_value.text = str(character.agility)
	intellect_value.text = str(character.intellect)
	cunning_value.text = str(character.cunning)
	willpower_value.text = str(character.willpower)
	presence_value.text = str(character.presence)
	
	astrogation_bar.set_progress(character.astrogation, character.intellect)
	athletics_bar.set_progress(character.athletics, character.brawn)
	charm_bar.set_progress(character.charm, character.presence)
	coercion_bar.set_progress(character.coercion, character.willpower)
	computers_bar.set_progress(character.computers, character.intellect)
	cool_bar.set_progress(character.cool, character.presence)
	coordination_bar.set_progress(character.coordination, character.agility)
	deception_bar.set_progress(character.deception, character.cunning)
	discipline_bar.set_progress(character.discipline, character.willpower)
	leadership_bar.set_progress(character.leadership, character.presence)
	mechanics_bar.set_progress(character.mechanics, character.intellect)
	medicine_bar.set_progress(character.medicine, character.intellect)
	negotiation_bar.set_progress(character.negotiation, character.presence)
	perception_bar.set_progress(character.perception, character.cunning)
	piloting_bar.set_progress(character.piloting, character.agility)
	resilience_bar.set_progress(character.resilience, character.brawn)
	skulduggery_bar.set_progress(character.skulduggery, character.cunning)
	stealth_bar.set_progress(character.stealth, character.agility)
	streetwise_bar.set_progress(character.streetwise, character.cunning)
	survival_bar.set_progress(character.survival, character.cunning)
	vigilance_bar.set_progress(character.vigilance, character.willpower)
	
	brawl_bar.set_progress(character.brawl, character.brawn)
	gunnery_bar.set_progress(character.gunnery, character.agility)
	melee_bar.set_progress(character.melee, character.brawn)
	ranged_light_bar.set_progress(character.ranged_light, character.agility)
	ranged_heavy_bar.set_progress(character.ranged_heavy, character.agility)
	
	inventory_value.text = "[ul]%s[/ul]" % ["\n".join(character.inventory)]
	talents_value.text = "[ul]%s[/ul]" % ["\n".join(character.talents)]
	
	if character.disposition:
		disposition_value.text = "[ul]%s[/ul]" % ["\n".join(character.disposition)]
	else:
		disposition_value.text = "[ul]None[/ul]"

	if character.available_quests:
		available_quests_value.text = "[ul]%s[/ul]" % ["\n".join(character.available_quests)]
	else:
		available_quests_value.text = "[ul]None[/ul]"

	main_container.show()
