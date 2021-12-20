extends CanvasLayer

func _ready():
	mostrar(false)
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		mostrar(get_tree().paused)
		get_tree().paused = !get_tree().paused

func mostrar(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_continuarBotao_pressed():
	mostrar(false)
	get_tree().paused = false
