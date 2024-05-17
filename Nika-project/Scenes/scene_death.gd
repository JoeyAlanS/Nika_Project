extends Control

func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_quit_1_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

