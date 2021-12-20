extends Node2D

var inimigo_1 = preload("res://Inimigo_simples.tscn")

func _ready() -> void:
	Global.pontos = 0
	Global.criacao_no_pai = self
	
func _exit_tree() -> void:
	Global.criacao_no_pai = null

func _on_timer_spawn_inimigo_timeout():
	var posicao_inimigo = Vector2(rand_range(-160,670),rand_range(-90,390))
	
	while posicao_inimigo.x < 640 and posicao_inimigo.x > -80 and posicao_inimigo.y < 360 and posicao_inimigo.y > -45:
		posicao_inimigo = Vector2(rand_range(-160,670),rand_range(-90,390))
		
	Global.instance_node(inimigo_1, posicao_inimigo, self)

func _on_timer_dificuldade_timeout():
	if $timer_spawn_inimigo.wait_time > 0.50:
		$timer_spawn_inimigo.wait_time -= 0.10
