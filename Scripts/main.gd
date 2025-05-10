extends Node2D

@onready var bot = $Bot
@onready var atacar = $Atacar
@onready var salir = $Salir
@onready var saltar = $Saltar
@onready var indicadorturno = $IndicadorTurno

signal clic_personal

func _ready():
	var escena_cargada = load(Global.escena_seleccionada)
	atacar.visible = false
	salir.visible = false
	if escena_cargada is PackedScene:  # Verificar que sea una escena válida
		var instancia = escena_cargada.instantiate()  # Instanciar la escena
		instancia.position = Vector2(976, 680) 
		add_child(instancia) 
		if instancia.has_signal("clic_personal"):
			instancia.connect("clic_personal", _on_input_event)
		print("✅ Escena añadida correctamente")
	else:
		print("⚠ Error: La ruta no contiene una escena válida ->", Global.escena_seleccionada)
		
func _process(delta):
	saltar.visible = Global.puede_jugar
	if Global.puede_jugar:
		indicadorturno.text = "Tu turno"
	else:
		indicadorturno.text = "Turno del rival"

func _on_input_event():
	_visible()

func _visible() -> void:
	atacar.visible = true
	salir.visible = true

func _on_boton_salir_pressed() -> void:
	atacar.visible = false
	salir.visible = false# Replace with function body.

func _on_atacar_pressed() -> void:
	if Global.puede_jugar:
		Global.puede_jugar = false
		print("ScriptMain: Turno del jugador")
		atacar.visible = false
		salir.visible = false
		saltar.visible = false
		bot.cambiar_turno()


func _on_saltar_pressed() -> void:
	if Global.puede_jugar:
		Global.puede_jugar = false
		print("ScriptMain: Turno del jugador")
		atacar.visible = false
		salir.visible = false
		saltar.visible = false
		bot.cambiar_turno()
