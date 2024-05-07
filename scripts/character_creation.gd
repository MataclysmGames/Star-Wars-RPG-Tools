extends CanvasLayer

@onready var button: Button = $MarginContainer/FullContainer/TopContainer/Button
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

@onready var inventory_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/InventoryValue
@onready var talents_value: RichTextLabel = $MarginContainer/FullContainer/MainContainer/InventoryContainer/MarginContainer/Container/TalentsValue

func _ready() -> void:
	button.pressed.connect(create_button_pressed)
	main_container.hide()

func create_button_pressed():
	button.release_focus()
	var random_character : CharacterInfo = CharacterInfo.new()
	random_character = random_character.random()
	
	profile.texture = load("res://assets/%s-%s.png" % [random_character.species.to_lower(), random_character.gender.to_lower()])
	if not profile.texture:
		profile.texture = load("res://assets/%s.png" % [random_character.species.to_lower()])
	if not profile.texture:
		profile.texture = load("res://assets/default.png")
	
	name_value.text = random_character.character_name
	species_value.text = random_character.species
	career_value.text = random_character.career
	specs_value.text = ", ".join(random_character.specs)
	obligation_value.text = random_character.obligation
	motivation_value.text = random_character.motivation
	
	soak_value.text = str(random_character.soak_value)
	wound_threshold_value.text = str(random_character.wound_threshold)
	strain_threshold_value.text = str(random_character.strain_threshold)
	
	brawn_value.text = str(random_character.brawn)
	agility_value.text = str(random_character.agility)
	intellect_value.text = str(random_character.intellect)
	cunning_value.text = str(random_character.cunning)
	willpower_value.text = str(random_character.willpower)
	presence_value.text = str(random_character.presence)
	
	astrogation_bar.set_progress(random_character.astrogation, random_character.intellect)
	athletics_bar.set_progress(random_character.athletics, random_character.brawn)
	charm_bar.set_progress(random_character.charm, random_character.presence)
	coercion_bar.set_progress(random_character.coercion, random_character.willpower)
	computers_bar.set_progress(random_character.computers, random_character.intellect)
	cool_bar.set_progress(random_character.cool, random_character.presence)
	coordination_bar.set_progress(random_character.coordination, random_character.agility)
	deception_bar.set_progress(random_character.deception, random_character.cunning)
	discipline_bar.set_progress(random_character.discipline, random_character.willpower)
	leadership_bar.set_progress(random_character.leadership, random_character.presence)
	mechanics_bar.set_progress(random_character.mechanics, random_character.intellect)
	medicine_bar.set_progress(random_character.medicine, random_character.intellect)
	negotiation_bar.set_progress(random_character.negotiation, random_character.presence)
	perception_bar.set_progress(random_character.perception, random_character.cunning)
	piloting_bar.set_progress(random_character.piloting, random_character.agility)
	resilience_bar.set_progress(random_character.resilience, random_character.brawn)
	skulduggery_bar.set_progress(random_character.skulduggery, random_character.cunning)
	stealth_bar.set_progress(random_character.stealth, random_character.agility)
	streetwise_bar.set_progress(random_character.streetwise, random_character.cunning)
	survival_bar.set_progress(random_character.survival, random_character.cunning)
	vigilance_bar.set_progress(random_character.vigilance, random_character.willpower)
	
	brawl_bar.set_progress(random_character.brawl, random_character.brawn)
	gunnery_bar.set_progress(random_character.gunnery, random_character.agility)
	melee_bar.set_progress(random_character.melee, random_character.brawn)
	ranged_light_bar.set_progress(random_character.ranged_light, random_character.agility)
	ranged_heavy_bar.set_progress(random_character.ranged_heavy, random_character.agility)
	
	inventory_value.text = "[ul]%s[/ul]" % ["\n".join(random_character.inventory)]
	talents_value.text = "[ul]%s[/ul]" % ["\n".join(random_character.talents)]
	main_container.show()
