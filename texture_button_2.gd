extends TextureButton


# Called when the node enters the scene tree for the first time.
var vidaEnemigo : TextureProgressBar

func _pressed() -> void:
	queue_free()
