extends Node2D


@onready var bola : Area2D = $"../Bola"

var pontuacao_jogador1 : int = 0
var pontuacao_jogador2 : int = 0


func _ready():
	pass


func _process(delta):
	pass


func _on_gol_1_area_entered(area):
	pontuacao_jogador2 += 1
	bola.rodar_timer()


func _on_gol_2_area_entered(area):
	pontuacao_jogador1 += 1
	bola.rodar_timer()
