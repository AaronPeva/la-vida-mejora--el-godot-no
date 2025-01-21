extends TextureButton

signal carta_jugada

func _pressed() -> void:
	emit_signal("carta_jugada")  # Emite la señal para avisar que esta carta fue jugada
	queue_free()  # Elimina la carta de la mano
