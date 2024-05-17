extends CharacterBody2D

# Constantes de movimento
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var hand : Node2D = $flauta
@onready var pistol : Sprite2D = $flauta/Sprite2D
@onready var pistol_bullet_marker : Marker2D = $flauta/Sprite2D/Marker2D
#@onready var bullet_load : PackedScene = preload("res://Scenes/Props/bullet.tscn")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation:= $AnimatedSprite2D as AnimatedSprite2D
var is_jumping := false
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif is_on_floor():
		is_jumping = false
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !is_jumping:
			animation.play("nika_run")
	elif is_jumping:
		animation.play("nika_jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("nika_idle")

	# Movimentação e colisão
	move_and_slide()
	
#func shoot():
	#EventManager.bullets_amount -= 1
	#EventManager.update_bullet_ui.emit()
	#var mouse_position : Vector2 = (get_global_mouse_position() - global_position).normalized()
	#pistol_bullet_marker.add_child(muzzle)
	#bullet.global_position = pistol_bullet_marker.global_position
	#bullet.target_vector = mouse_position
	#bullet.rotation = mouse_position.angle()
	#get_tree().current_scene.add_child(bullet)
	#AudioManager.play_sound(AudioManager.SHOOT)

#func _on_Item_body_entered(item: Item):
  #  if not item.is_in_scene_tree():
  #      return

   # pegar_item(item)  # Presume que pegar_item está definida no script Arma.gd
   # item.queue_free()  # Remover o item da cena após pegá-lo
