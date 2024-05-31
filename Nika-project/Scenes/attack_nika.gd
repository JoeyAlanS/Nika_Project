extends Area2D

var bullet_speed := 300
var direction:= 1

func _ready():
	pass
func set_direction(dir):
	direction = dir 

func _physics_process(delta: float)-> void:
	position.x += bullet_speed * delta * direction


func _on_visible_on_screen_enabler_2d_screen_exited():
	pass # Replace with function body.
