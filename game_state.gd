
extends Node

# Member variables
var mail_score = 0
var enemy_score = 1
var best_time = 0
var user_time_completed = 0


func _ready():
	var f = File.new()
	#Load high score will be saved to : C:\Users\<USER>\AppData\Roaming\Godot\app_userdata\ 
	# Not sure of file save location after exporting to HTML5
	if (f.open("user://highscore", File.READ) == OK):
		best_time = f.get_var()




func game_over():
	if (user_time_completed > best_time):
		best_time = user_time_completed
		# Save high score / best time
		var f = File.new()
		f.open("user://highscore", File.WRITE)
		f.store_var(best_time)