extends Area2D


# Parâmetros
var velocidade_da_bola : int = 500
var posicao_inicial : Vector2 = Vector2(640, 360)
var direcao_inicial : Vector2 = Vector2(0, 0)
var nova_direcao : Vector2 = Vector2(0, 0)

var y_minimo : float = 0
var y_maximo : float = 720

# Timer
@onready var timer : Timer = $Timer


func _ready():
	rodar_timer()


func _process(delta):
	movimentar_bola(delta)
	colidir_com_as_paredes()
	

func rodar_timer() -> void:
	timer.start()


func resetar_bola() -> void:
	# Centraliza a Bola e a manda para uma direção aleatória
	position = posicao_inicial
	escolher_direcao_inicial()


func escolher_direcao_inicial() -> void:
	# Escolhe as direções Horizontal e Vertical
	var x_aleatorio = [-1, 1].pick_random()
	var y_aleatorio = [-1, 1].pick_random()
	
	# Aplica as novas direções
	direcao_inicial = Vector2(x_aleatorio, y_aleatorio)
	nova_direcao = direcao_inicial


func movimentar_bola(delta : float) -> void:
	position += nova_direcao * velocidade_da_bola * delta
	

func colidir_com_as_paredes() -> void:
	# Manda a Bola na direção contrária ao tentar sair da tela
	if position.y >= y_maximo or position.y <= y_minimo:
		nova_direcao.y *= -1		
		
	# +1 * +1 = +1
	# +1 * -1 = -1
	# -1 * -1 = +1	


func _on_body_entered(body):
	# Manda a Bola na direção contrária ao colidir com os jogadores
	if body.is_in_group("jogadores"):
		nova_direcao.x *= -1


func _on_timer_timeout():
	resetar_bola()
