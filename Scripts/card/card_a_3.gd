extends "res://Scripts/card/card_character.gd"

func _ready() -> void:
	super._ready()
	Global.hp_carta_jugador = 120
	Global.attack_damage = 10
	Global.attack_cost = 3
	Global.carta1 = false
	Global.carta3 = true
