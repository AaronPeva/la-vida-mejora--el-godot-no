extends TextureButton


# Called when the node enters the scene tree for the first time.
var vidaJugador : TextureProgressBar

func _pressed() -> void:
	vidaJugador.value -= 2
	if vidaJugador.value < 0:
		vidaJugador.value = 0
	queue_free()
