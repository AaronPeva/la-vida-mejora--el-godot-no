extends Node2D

signal hovered
signal hovered_off
signal bot_attacked
var barra_energia
var energy_consume = 1
var starting_position
var card_slot_card_is_in
@onready var richtext = $Valor
var valor 
@onready var vidaBoss = get_node("/root/Main/Boss/Sprite2D/vidabot")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	valor = richtext.text.to_int()
	add_to_group("cartas")
	get_parent().connect_card_signals(self) # Replace with function body.
	barra_energia = get_node("/root/Main/EnergyNode/EnergyBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self) # Replace with function body.

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self) # Replace with function body.
	self.z_index = 1


func isPlayerCharacterCard() -> bool:
	return self.scene_file_path == Global.escena_seleccionada

func _consume_card() -> void:
	if barra_energia:
		barra_energia.value -= energy_consume
	else:
		print("⚠️ ¡No tengo barra, coach!")

func _remove_card() -> void:
	var hand_manager = get_node("/root/Main/PlayerHand")  # Ajusta esta ruta a tu escena
	if hand_manager:
		hand_manager.remove_card_from_hand(self)
		self.queue_free()





func highlight_card(dragged):
	if dragged:
		self.z_index = 2

func accion_consumible():
	_remove_card()
	pass
