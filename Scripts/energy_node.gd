extends Node2D

@onready var energ = $TextoEnerg
var ya_sumado = false

func _process(delta):
	if Global.puede_jugar and not ya_sumado:
		var valor_actual = int(energ.text)
		energ.text = str(valor_actual + 1)
		ya_sumado = true  # Se asegura de no sumar más mientras siga en true xd
	elif not Global.puede_jugar:
		ya_sumado = false  # Se resetea cuando Global.puede_jugar vuelve a false xd
