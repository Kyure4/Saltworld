class_name enemyCharacter
extends characterBase

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _on_enemy_texture_button_pressed() -> void:
	targeted.emit()

func on_hit(damage_base : int) -> void : 
	super(damage_base)
	animation_player.play("on_hit")
