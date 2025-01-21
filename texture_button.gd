extends TextureButton

@onready var area_2d = null
var original_parent = null

func _ready():
	original_parent = get_parent()  # Obtén el nodo padre original del botón
	
	# Intentar encontrar el nodo Area2D
	area_2d = get_parent().get_node_or_null("Area2D")
	
	# Validar si Area2D se encuentra correctamente
	if area_2d == null:
		print("Error: No se encontró el nodo 'Area2D'.")
		print("Parent Node:", get_parent().name)
		print("Children of Parent Node:", get_parent().get_children())
		return
	
	# Conectar la señal de presión del botón
	connect("pressed", Callable(self, "_on_texture_button_pressed"))

func _on_texture_button_pressed():
	if area_2d == null:
		print("Error: No se puede mover al Area2D porque es null.")
		return
	move_to_area_2d()
	await_disappear()

func move_to_area_2d():
	# Cambiar al nodo Area2D
	var global_position = get_global_position()
	
	# Verificar que el nodo padre original sea válido
	if original_parent:
		original_parent.remove_child(self)
	else:
		print("Error: original_parent es null.")
	
	# Verificar que Area2D sea válido
	if area_2d:
		area_2d.add_child(self)
		set_global_position(global_position)
	else:
		print("Error: area_2d sigue siendo null al intentar mover.")

func await_disappear():
	# Esperar 2 segundos y devolver al nodo original
	await get_tree().create_timer(2).timeout
	
	if area_2d:
		area_2d.remove_child(self)
	else:
		print("Error: area_2d es null al intentar eliminar el nodo.")
	
	if original_parent:
		original_parent.add_child(self)
	
	hide()  # Ocultar el botón después de 2 segundos
