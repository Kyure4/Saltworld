class_name characterManager
extends VBoxContainer

signal enemy_selected
@onready var enemy_list : Array = get_tree().get_nodes_in_group("Enemy")
var target_enemy : enemyCharacter

func _ready() -> void:
	for enemy : enemyCharacter in enemy_list:
		enemy.targeted.connect(on_enemy_targeted.bind(enemy))

func on_enemy_targeted(target : enemyCharacter) -> void:
	target_enemy = target
	enemy_selected.emit()
	
func return_enemy_target() -> enemyCharacter:
	await enemy_selected
	return target_enemy
