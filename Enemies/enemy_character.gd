class_name enemyCharacter
extends characterBase

func _on_enemy_texture_button_pressed() -> void:
	targeted.emit()
