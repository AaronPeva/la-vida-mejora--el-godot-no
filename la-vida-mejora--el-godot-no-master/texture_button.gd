extends TextureButton


# Called when the node enters the scene tree for the first time.
var vidaEnemigo : TextureProgressBar

func _pressed() -> void:
	vidaEnemigo.value -= 1
	if vidaEnemigo.value < 0:
		vidaEnemigo.value = 0
	queue_free()
