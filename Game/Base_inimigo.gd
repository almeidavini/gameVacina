extends Sprite

export(int) var velocidade = 75
var mov = Vector2.ZERO
var atordoado = false
export(int) var recuo = 600
export(int) var hp = 3
var particulas_sangue = preload("res://particula_sangue.tscn")
onready var cor_atual = modulate

func _process(delta):
	if hp <= 0 and Global.criacao_no_pai != null:
		if Global.camera != null:
			Global.camera.tremer_tela(50, 0.1)
			
		Global.pontos += 10
		var instancia_particula_sangue = Global.instance_node(particulas_sangue, global_position, Global.criacao_no_pai)
		instancia_particula_sangue.rotation = mov.angle()
		instancia_particula_sangue.modulate = Color.yellow
		queue_free()

func movimento_basico_inimigo(delta):
	if Global.jogador != null and atordoado == false:
		mov = global_position.direction_to(Global.jogador.global_position)
		global_position += mov * velocidade * delta
	elif atordoado:
		mov = lerp(mov, Vector2.ZERO, 0.3)
		global_position += mov * delta
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("dano") and atordoado == false:
		modulate = Color.darkblue
		area.get_parent().queue_free()
		mov = -mov * recuo
		atordoado = true
		hp -= 1
		$timer_recuo.start()

func _on_timer_recuo_timeout():
	modulate = cor_atual
	atordoado = false
