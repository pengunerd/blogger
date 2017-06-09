extends Node

# Member variables
# Want to get highest numnber of mails collected (mail_score) before killing all enemies (enemy_score)
# When enemy_score == 0, game over!
var mail_score = 0
var enemy_score = 5

# Bootstrapping scores; best_time == 9999 initially 
var best_time = 9999
var best_score = 0
var user_time_completed = 0

func setup_game():
	# Want to get highest numnber of mails collected (mail_score) before killing all enemies (enemy_score)
	# When enemy_score == 0, game over!
	mail_score = 0
	enemy_score = 5
	user_time_completed = 0
	#print("Resetting game state: ", mail_score,enemy_score,user_time_completed)


func _ready():
	var f = File.new()
	#Load high score will be saved to : C:\Users\<USER>\AppData\Roaming\Godot\app_userdata\ 
	# Not sure of file save location after exporting to HTML5
	if (f.open("user://highscore", File.READ) == OK):
		best_time = f.get_var()
		best_score = f.get_var()




func game_over():
	# set BEST score = mail score (number of mails user collected) if it is higher
	if(mail_score > best_score):
		best_score = mail_score
		print("SAVING BEST SCORE: ", best_score)
	#if (user_time_completed < best_time):
		best_time = user_time_completed
		print("SAVING BEST TIME: ", best_time)
		# Save high score / best time
		var f = File.new()
		f.open("user://highscore", File.WRITE)
		f.store_var(best_time)
		f.store_var(best_score)
	elif(mail_score == best_score):
		#print("mail score == current highest score, checking if faster time")
		# if user_time_completed in FASTER time than the best time, update it
		if (user_time_completed < best_time):
			best_time = user_time_completed
			print("SAVING BEST TIME: ", best_time)
		# Save high score / with updated best time
			var f = File.new()
			f.open("user://highscore", File.WRITE)
			f.store_var(best_time)
			f.store_var(best_score)