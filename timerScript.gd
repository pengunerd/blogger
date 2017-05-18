extends Label


var time_start = 0
var time_now = 0

func _ready():
	time_start = OS.get_unix_time()
	set_process(true)

func _process(delta):
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	print("elapsed : ", str_elapsed)
	#set_text("Time : " + str_elapsed)
	set_text(str_elapsed)
	get_node("../mail_counter").set_text(str(get_node("/root/game_state").mail_score))