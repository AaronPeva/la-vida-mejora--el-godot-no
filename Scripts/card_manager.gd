extends Node2D

const COLLISION_MASK_CARD = 1
const COLLISION_MASK_CARD_SLOT = 4
const DEFAULT_CARD_MOVE_SPEED = 0.2

var screen_size
var card_being_dragged
var is_hovering_on_card
var player_hand_reference

func _ready():
	screen_size = get_viewport_rect().size
	player_hand_reference = $"../PlayerHand"
	$"../InputManager".connect("left_mouse_button_released", on_left_click_released)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(clamp(mouse_pos.x, 0, screen_size.x),
			clamp(mouse_pos.y, 0, screen_size.y))



func start_drag(card):
	if Global.puede_jugar:
		if card.isPlayerCharacterCard():
			return
		card_being_dragged = card
		card.scale = Vector2(0.475, 0.475)
		card.highlight_card(true)


func finish_drag():
	card_being_dragged.scale = Vector2(0.4, 0.4)
	player_hand_reference.add_card_to_hand(card_being_dragged, DEFAULT_CARD_MOVE_SPEED)
	card_being_dragged.highlight_card(false)
	card_being_dragged = null


func connect_card_signals(card):
	if card.isPlayerCharacterCard():
		card.connect("hovered", on_hovered_over_card)
		card.connect("hovered_off", on_hovered_off_card)

func on_left_click_released():
	if card_being_dragged:
		finish_drag()

func on_hovered_over_card(card):
	if !is_hovering_on_card:
		is_hovering_on_card = true

func on_hovered_off_card(card):
	if !card.card_slot_card_is_in && card_being_dragged:
		var new_card_hovered = raycast_check_for_card()



func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return get_card_with_highest_z_index(result)
	return null

func get_card_with_highest_z_index(cards):
	var highest_z_card = cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index
	
	
	for i in range(1, cards.size()):
		var current_card = cards[i].collider.get_parent()
		if current_card.z_index > highest_z_index:
			highest_z_card = current_card
			highest_z_index = current_card.z_index
	return highest_z_card
