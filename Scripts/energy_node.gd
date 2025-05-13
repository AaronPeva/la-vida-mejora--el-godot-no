extends Node2D

@onready var energ = $TextEnerg	
var ya_sumado = false

func _process(delta):
	if Global.puede_jugar and not ya_sumado:
		var valor_actual = int(energ.text)
		# Asegurarse de que el valor no baje de 0
		valor_actual = max(valor_actual + 1, 0)  # Esto garantiza que no baje de 0
		energ.text = str(valor_actual)
		ya_sumado = true  # Se asegura de no sumar más mientras siga en true xd
		# Cambiar el color del texto dependiendo del valor
		actualizar_color(valor_actual)
	elif not Global.puede_jugar:
		ya_sumado = false  # Se resetea cuando Global.puede_jugar vuelve a false xd

# Función para actualizar el color
func actualizar_color(valor):
	match valor:
		3:
			energ.modulate = Color(1, 0.6, 0)  # Naranja
		2:
			energ.modulate = Color(1, 0.4, 0)  # Rojo claro
		1:
			energ.modulate = Color(1, 0, 0)    # Rojo
		0:
			energ.modulate = Color(0.6, 0, 0)  # Super rojo
		_:
			energ.modulate = Color(1, 1, 1)    # Blanco (por si el valor es mayor que 3 xd)
