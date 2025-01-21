extends Node2D

# Referencias a los nodos
@onready var button = $Button
@onready var grid_container = $GridContainer
@onready var cards = [ $A1, $A2 ] # Lista de cartas (TextureButtons)

# Tamaño deseado para las cartas
const CARD_SIZE = Vector2(229, 252)
const MAX_CARDS = 5  # Número máximo de cartas que se pueden apilar

func _ready():
# Conectar la señal del botón
	button.pressed.connect(_on_button_pressed)
	grid_container.columns = 5  # Máximo de columnas

func _on_button_pressed():
	# Verificar cuántas cartas ya están en el GridContainer
	if grid_container.get_child_count() < MAX_CARDS:
	# Elegir una carta aleatoria
		var random_card = cards[randi() % cards.size()]

# Duplicar la carta
		var card_instance = random_card.duplicate()

# Aplicar el tamaño deseado
		card_instance.custom_minimum_size = CARD_SIZE  # Fija el tamaño mínimo

# Agregar la carta al GridContainer
		grid_container.add_child(card_instance)
	else:
		print("No se pueden agregar más cartas. Se alcanzó el límite de una fila.")
