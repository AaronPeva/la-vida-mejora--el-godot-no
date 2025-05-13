extends AnimatedSprite2D

func _ready():
	position = Vector2(0, -30)  # Offset relativo al padre


func _process(delta):
	position.x += 100 * delta  # Esto moverá a BolaAnimada, y todos sus hijos con él (incluido el Label)
