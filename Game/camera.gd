extends Camera2D

var intensidade_tremor_camera = 0
var iniciar_tremor_camera = false

func _process(delta):
	zoom = lerp(zoom, Vector2(1,1), 0.3)
	
	if iniciar_tremor_camera:
		global_position += Vector2(rand_range(-intensidade_tremor_camera, intensidade_tremor_camera), 
		rand_range(-intensidade_tremor_camera, intensidade_tremor_camera)) * delta

func tremer_tela(intensidade, tempo):
	zoom = Vector2(1,1) - Vector2(intensidade * 0.02, intensidade * 0.02)
	intensidade_tremor_camera = intensidade
	$timer_camera.wait_time = tempo
	$timer_camera.start()
	iniciar_tremor_camera = true

func _ready():
	Global.camera = self
	
func _exit_tree():
	Global.camera = null

func _on_timer_camera_timeout():
	iniciar_tremor_camera = false
