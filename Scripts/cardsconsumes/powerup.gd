extends "res://Scripts/card.gd"
#var contador

func _ready() -> void:
	super._ready()
	
	



	#super._ready()
	#contador = 2
func _consume_card() -> void:
	print("paso por aqui")
	emit_signal("bot_attacked",attack)
	_remove_card()
	
	
# recordatior que podemos invocar al padre	
#func _delete_card() -> void:
	#if contador != 0:
		#contador = contador - 1 
	#else:
		#super._delete_card()
