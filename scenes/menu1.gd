extends CanvasLayer


func _on_button_quit_pressed():
	get_tree().quit()


func _on_button_retry_pressed():
	get_tree().reload_current_scene()
