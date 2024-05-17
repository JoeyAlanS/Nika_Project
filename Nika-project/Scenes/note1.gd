extends Area2D

#export (float) var respawn_time = 5.0
#export (PackedScene) var item_scene
#
#func _ready():
	## Conecta o sinal de corpo entrado ao método _on_body_entered
	#connect("body_entered", self, "_on_body_entered")
#
## Chamado quando um corpo entra na área
#func _on_body_entered(body):
	#if body.is_in_group("players"): # Verifica se o corpo é um jogador
		#queue_free() # Remove o item
		## Cria um temporizador para reinstanciar o item
		#var timer = Timer.new()
		#timer.wait_time = respawn_time
		#timer.one_shot = true
		#timer.connect("timeout", self, "_on_timeout")
		#get_parent().add_child(timer)
		#timer.start()
#
#func _on_timeout():
	## Reinstancia o item
	#var new_item = item_scene.instance()
	#new_item.position = position # Coloca o item na mesma posição
	#get_parent().add_child(new_item)
