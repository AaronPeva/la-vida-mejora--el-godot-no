extends TextureButton

# Referencia al nodo de vida del jugador
var vidaJugador: TextureProgressBar

# Método para asignar la vida del jugador
func set_vida_jugador(nodo_vida: TextureProgressBar) -> void:
	vidaJugador = nodo_vida

# Resta vida al jugador al presionar
func _pressed() -> void:
	if vidaJugador:
		vidaJugador.value -= 2
		if vidaJugador.value < 0:
			vidaJugador.value = 0
		queue_free()  # Elimina esta carta
	else:
		print("Error: vidaJugador no está asignado.")
