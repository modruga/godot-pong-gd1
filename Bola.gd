extends Area2D

export var velocidade_h = 300
export var velocidade_v = 300
export var acelera = 20
export (NodePath) var audio

var VH_INICIAL = velocidade_h
var VV_INICIAL = velocidade_v
var jogando = false
var screen_size

signal ponto_esq
signal ponto_dir

func _ready():
	screen_size = get_viewport_rect().size
	jogar()
	audio = get_node(audio)

func _process(delta):
	if(jogando):
		position.y += velocidade_v * delta
		position.x += velocidade_h * delta
	
	if(position.y < 0 or position.y > screen_size.y):
		velocidade_v = velocidade_v * -1
	
	if(position.x < 0):
		jogando = false
		emit_signal("ponto_dir")
		jogar()
	
	if(position.x > screen_size.x):
		emit_signal("ponto_esq")
		jogar()


func _on_Bola_area_entered(area):
	velocidade_h = (velocidade_h + acelera * sign(velocidade_h)) * -1
	velocidade_v += acelera * sign(velocidade_v)
	audio.play()
	

func jogar():
	position.x  = screen_size.x / 2
	position.y = screen_size.y / 2
	
	velocidade_h = VH_INICIAL
	velocidade_v = VV_INICIAL
	
	if(randi() % 2 == 1):
		velocidade_h = velocidade_h * -1
	
	if(randi() % 2 == 1):
		velocidade_v = velocidade_v * -1
	
	yield(get_tree().create_timer(1), "timeout")
	jogando = true
