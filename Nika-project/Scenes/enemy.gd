extends Area2D
## Vida do inimigo (agora aleatória)
#var vida: int = 0 # Valor inicial será definido no _ready()
#
## Quantidade de dano necessário para matar o inimigo
#var dano_necessario = 50 # Valor inicial (ajuste de acordo com o seu jogo)
#
## Texto para exibir a vida
#var texto_vida: Label = null # Referência para o label da vida (será definido posteriormente)
#
## Posição inicial do inimigo
#var posicao_inicial: Vector2 = null # Vector2 que armazena a posição inicial (será definido posteriormente)
#
#func _ready():
	## Carregar o label da vida da cena
	#texto_vida = get_node("TextoVida") # Nome do seu label na cena
	#if texto_vida is null:
		#print_err("Erro: Label 'TextoVida' não encontrado na cena.")
		#return
#
	## Salvar a posição inicial do inimigo
	#posicao_inicial = global_position
#
	## Gerar vida aleatória entre 1 e 100
	#vida = rand_range(1, 101)
#
	## Conectar sinal para detecção de colisão com o jogador
	#connect("body_entered", self, "_on_BodyEntered")
#
#func _on_BodyEntered(outro_corpo: Node):
	#if outro_corpo.is_kind_of(Player):
		## Aplicar dano ao jogador
		#outro_corpo.vida -= 1
#
		## Verificar se o inimigo deve morrer
		#if vida <= 0:
			## Inimigo morto!
			#reaparecer()
		#else:
			## Diminuir a vida do inimigo
			#vida -= dano_causado
			## Atualizar o texto da vida
			#atualizar_texto_vida()
#
#func reaparecer():
	## Redefinir a vida do inimigo
	#vida = dano_necessario
#
	## Reposicionar o inimigo na posição inicial
	#global_position = posicao_inicial
#
	## Atualizar o texto da vida
	#atualizar_texto_vida()
#
#func atualizar_texto_vida():
	## Exibir a vida atual do inimigo no label com zeros à esquerda
	#texto_vida.text = String.lpad("Vida: " + String(vida), 6, "0")
