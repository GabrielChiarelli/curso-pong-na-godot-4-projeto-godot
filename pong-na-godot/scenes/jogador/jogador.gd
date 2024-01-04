extends StaticBody2D


@export var jogador1 : bool
var velocidade_do_jogador : int = 500


func _ready():
	pass


func _process(delta):
	movimentar_jogador(delta)
	limitar_movimento_do_jogador()
	

func movimentar_jogador(delta : float) -> void:
	# Movimento do Jogador 1
	if jogador1:
		if Input.is_action_pressed("mv-cima-1"):
			position.y -= velocidade_do_jogador * delta
		elif Input.is_action_pressed("mv-baixo-1"):
			position.y += velocidade_do_jogador * delta
	
	# Movimento do Jogador 2
	else:
		if Input.is_action_pressed("mv-cima-2"):
			position.y -= velocidade_do_jogador * delta
		elif Input.is_action_pressed("mv-baixo-2"):
			position.y += velocidade_do_jogador * delta


func limitar_movimento_do_jogador() -> void:
	# Impede que o jogador saia da tela
	position.y = clamp(position.y, 64, 654)
