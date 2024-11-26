extends Node2D

# Referencias a los nodos
@onready var texture_button = $TextureButton
@onready var area_2d = $Area2D

func _ready():
	# Conecta la señal "pressed" del TextureButton a la función correspondiente
	texture_button.pressed.connect(on_texture_button_pressed)

# Función que se ejecutará al presionar el botón
func on_texture_button_pressed():
	print("¡Carta lanzada!")
	
	# Mueve la carta al centro del Area2D
	var texture_button_size = texture_button.size
	var area_2d_position = area_2d.global_position
	var new_position = area_2d_position - texture_button_size / 2
	texture_button.global_position = new_position
	
	# Llama a una función para ocultar la carta después de 2 segundos
	call_deferred("hide_card_after_delay")

func hide_card_after_delay():
	# Espera 2 segundos antes de ocultar la carta
	await get_tree().create_timer(2.0).timeout
	texture_button.hide()
