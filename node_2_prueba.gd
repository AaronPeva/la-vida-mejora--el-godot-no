extends Node2D

@onready var hand_layout = $GridContainer
var mazo = []
var carta_scene = preload("res://Card.tscn")

func _ready():
	cargar_mazo()

# Cargar el mazo con más cartas
func cargar_mazo():
	for i in range(10):  # Cambié el número a 10 para tener un mazo más grande
		var carta = carta_scene.instantiate()
		mazo.append(carta)
	print("Mazo inicial cargado con %d cartas." % mazo.size())

# Función para robar una carta
func robar_carta():
	if hand_layout.get_child_count() < 5:  # Máximo de 5 cartas en la mano
		if mazo.size() > 0:
			var carta_robada = mazo.pop_back()
			hand_layout.add_child(carta_robada)
			print("Carta robada. Quedan %d cartas en el mazo." % mazo.size())
		else:
			print("El mazo está vacío. No puedes robar más cartas.")
	else:
		print("Ya tienes el máximo de 5 cartas en la mano.")

# Función opcional para actualizar la visibilidad del GridContainer (si es necesario)
func actualizar_mazo_visual():
	$GridContainer.visible = mazo.size() > 5
