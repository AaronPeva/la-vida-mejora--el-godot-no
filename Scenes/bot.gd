extends Node2D

@onready var vidabot = $Sprite2D/vidabot

func _ready() -> void:
	self.connect("bot_attacked",recieve_dmg)
#@onready var ataqueCarta = $Attack
func _on_area_2d_area_entered(area: Area2D) -> void:
	var card = area.get_parent()
	#var ataqueCarta = card.find_child("Attack")
	#var ataque = ataqueCarta.text.to_int()
	#vidabot.value -= ataque
	card._consume_card()
	#var hand_manager = get_node("/root/Main/PlayerHand")  # Ajusta esta ruta a tu escena
	#if hand_manager:
	#	hand_manager.remove_card_from_hand(card)
	#	card.queue_free()


func recieve_dmg(dmg: int):
	print("paso por aqui2")
	print(dmg)
	vidabot.value -= dmg
	

#var carta_activa = $Health
	#carta_activa.text = str(int(carta_activa.text) - damage)
