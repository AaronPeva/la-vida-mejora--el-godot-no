extends Node2D

# Referencias a los nodos
@onready var button = $Button
@onready var grid_container = $GridContainer
@onready var vidaJugador = $vidaA
@onready var vidaEnemigo = $vidaE

# Lista de cartas base (TextureButtons)
@onready var cards = [ $A1, $A2 ]

# Configuración
const CARD_SIZE = Vector2(159, 182)
const MAX_CARDS = 5  # Número máximo de cartas que se pueden apilar en el contenedor

var turnoJugador = true

func _ready() -> void:
	# Configuración inicial del GridContainer
	grid_container.columns = 5  # Máximo de columnas
	button.pressed.connect(_on_button_pressed)  # Conectar botón para añadir cartas
	
	# Conectar las señales de las cartas ya presentes en el GridContainer
	_conectar_cartas()

# Función para añadir cartas al presionar el botón
func _on_button_pressed() -> void:
	if grid_container.get_child_count() < MAX_CARDS:
		# Elegir una carta aleatoria
		var random_card = cards[randi() % cards.size()]
		
		# Duplicar la carta
		var card_instance = random_card.duplicate()
		
		# Configurar la carta
		card_instance.custom_minimum_size = CARD_SIZE
		card_instance.name = "GeneratedCard_%d" % grid_container.get_child_count()
		
		# Conectar la señal de clic de la carta
		card_instance.pressed.connect(_cuandoJugadorClicka)
		
		# Agregar la carta al GridContainer
		grid_container.add_child(card_instance)
	else:
		print("No se pueden agregar más cartas. Se alcanzó el límite de una fila.")

# Función para conectar las cartas existentes
func _conectar_cartas() -> void:
	for carta in grid_container.get_children():
		if carta is TextureButton:
			carta.pressed.connect(_cuandoJugadorClicka)

# Función llamada cuando el jugador presiona una carta
func _cuandoJugadorClicka() -> void:
	if turnoJugador:
		vidaEnemigo.value -= 1
		turnoJugador = false
