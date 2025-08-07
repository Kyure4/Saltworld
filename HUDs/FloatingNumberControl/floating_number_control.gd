class_name floatingNumberControl
extends Control

@onready var floating_number : PackedScene = preload("res://HUDs/FloatingNumberControl/floating_number.tscn")

func pushFloatingNumber(target_text : String, target_position : Vector2) -> void : 
	var floating_number_instance :RichTextLabel = floating_number.instantiate()
	add_child(floating_number_instance)
	floating_number_instance.text = target_text
	floating_number_instance.global_position = target_position 
	var tweener : Tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	var random_altitude := randf_range(-32, -64)
	tweener.tween_property(floating_number_instance, "position:y",random_altitude, 0.75).as_relative()
	tweener.tween_property(floating_number_instance, "modulate:a",0, 0.15)
	await tweener.finished
	floating_number_instance.queue_free()
