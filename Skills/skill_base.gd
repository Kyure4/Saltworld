class_name skillBase
extends Resource
@export var name : String
@export_enum("Offense", "Defense", "Support") var type := "Offense"

@export_category("Offense")
@export var damage_base := 6
@export var combo_base := 1
