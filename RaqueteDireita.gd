extends Area2D

export var velocidade = 1000
var screen_size


func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x - 150
	position.y = screen_size.y / 2

func _process(delta):
	if(Input.is_action_pressed("raquete_dir_up")):
		position.y -= velocidade * delta
	if(Input.is_action_pressed("raquete_dir_down")):
		position.y += velocidade * delta
	
	if(position.y < 50):
		position.y = 50
	if(position.y > screen_size.y - 50):
		position.y = screen_size.y -50

