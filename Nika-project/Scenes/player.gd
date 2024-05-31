extends CharacterBody2D

# Constantes de movimento
const bullet_scene := preload("res://Scenes/attack_nika.tscn")
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var is_shooting := false
@onready var bullet_position = $bullet_position
@onready var shoot_colwndown = $shoot_colwndown


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animation:= $AnimatedSprite2D as AnimatedSprite2D
var is_jumping := false
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("attack"):
		is_shooting = true
		if shoot_colwndown.is_stopped():
			shoot_bullet()
		else:
			is_shooting = false
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

func shoot_bullet():
	var bullet_instance = bullet_scene.instantiate()
	
	add_child(bullet_instance)
	bullet_instance.global_position = bullet_position.global_position
	shoot_colwndown.start()
	# Movimentação e colisão
	move_and_slide()

