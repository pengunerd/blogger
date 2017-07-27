extends Control

func _ready():
	# Get game_state best_score and associated best_time from file
	var best_score = get_node("/root/game_state").best_score
	var elapsed = get_node("/root/game_state").best_time
	#print(elapsed)
	#cast elapsed to integer because it became a float when adding milliseconds feature
	var minutes = int(elapsed) / 60
	var seconds = int(elapsed) % 60
	#calculate milliseconds and multiply by 1000 for display
	var milliseconds = elapsed - int(elapsed)
	var milliseconds_display = milliseconds * 10
	
	var str_elapsed = "%01dm %02d.%01ds" % [minutes, seconds, milliseconds_display]
	
	# hardcode if elapsed time==9999 (default starting), then don't display anything; else display best time
	if(elapsed == 99999999):
		get_node("time").set_text("Time: ")
	else:
		get_node("time").set_text("Time: " + str_elapsed)
	
	# hardcode if best_score==0 (default starting), then don't display anything; else display best time
	if(best_score == 0):
		get_node("score").set_text("Best Score: ")
	else:
		get_node("score").set_text("Best Score: " + str(best_score))


func _on_play_pressed():
	#get_node("/root/game_state").points = 0
	get_node("/root/game_state").setup_game()
	get_tree().change_scene("res://stage.tscn")

func _on_rules_pressed():
	get_tree().change_scene("res://instructions.tscn")
