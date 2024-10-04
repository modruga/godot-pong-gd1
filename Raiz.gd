extends Node2D

var ponto_esq = 0
var ponto_dir = 0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	
	$PontoEsquerda.margin_left = 50
	$PontoEsquerda.margin_top = 50
	
	$PontoDireita.margin_right = screen_size.x - 50
	$PontoDireita.margin_top = 50


func _on_Bola_ponto_dir():
	ponto_dir += 1
	$PontoDireita.text = str(ponto_dir)


func _on_Bola_ponto_esq():
	ponto_esq += 1
	$PontoEsquerda.text = str(ponto_esq)
