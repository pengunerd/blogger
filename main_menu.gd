extends Control

func _ready():
	var elapsed = get_node("/root/game_state").best_time
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	get_node("score").set_text("BEST TIME: " + str_elapsed)


func _on_play_pressed():
	#get_node("/root/game_state").points = 0
	get_tree().change_scene("res://stage.tscn")