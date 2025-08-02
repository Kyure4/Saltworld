@tool
class_name AttackCommandButton
extends Button

@export var assigned_skill : skillBase
@onready var character_manager : characterManager = owner.get_parent() as characterManager
@onready var skill_name_label : RichTextLabel = %SkillNameLabel
@onready var skill_dmg_label : RichTextLabel = %SkillDmgLabel

func _ready() -> void:
	fit_skill_to_content()

func fit_skill_to_content() -> void:
	if not assigned_skill : 
		skill_name_label.text = "Skill"
		skill_dmg_label.text = "???"
		return 
	skill_name_label.text = assigned_skill.name
	skill_dmg_label.text = str(assigned_skill.damage_base)
	if assigned_skill.combo_base > 1:
		skill_dmg_label.text = str(assigned_skill.damage_base) + "x" + str(assigned_skill.combo_base)

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		fit_skill_to_content()

func _on_pressed() -> void:
	print("Esperando target")
	var target_enemy := await character_manager.return_enemy_target()
	print("Target encontrado:" + str(target_enemy))
