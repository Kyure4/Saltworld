class_name characterBase
extends Node

signal targeted

@export var stats : statBase
var current_blood : int 

func _ready() -> void:
	if not stats:
		return
	current_blood = stats.max_blood

func basic_attack(target : characterBase) -> void:
	target.on_hit(self.stats.heat_base)

func on_hit(damage_base : int) -> void:
	if not stats:
		printerr("Personaje sin estadisticas")
		return
	var reduced_damage : int = damage_base * (stats.endurance_base/100)
	var net_damage : int = damage_base - reduced_damage 
	current_blood -= net_damage
