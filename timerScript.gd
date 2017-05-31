extends Label


var time_start = 0
var time_now = 0

func _ready():
	time_start = OS.get_unix_time()
	#print(time_start)
	set_fixed_process(true)

func _fixed_process(delta):
	
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	#print(OS.get_ticks_msec()%1000)
	var ms = float(OS.get_ticks_msec()%1000)
	var milliseconds = ms / 1000
	#print(milliseconds)
	elapsed = elapsed + milliseconds
	#print(elapsed)
	
	var str_elapsed = "%02d m: %02d s" % [minutes, seconds]
	#print("elapsed : ", str_elapsed)
	#set_text("Time : " + str_elapsed)
	set_text(str_elapsed)
	# mail counter - increases 
	get_node("../mail_counter").set_text(str(get_node("/root/game_state").mail_score))
	# enemy counter - decreases on kill
	get_node("../enemy_counter").set_text(str(get_node("/root/game_state").enemy_score))
	
	# Saving user time to game_state
	#print(elapsed)
	get_node("/root/game_state").user_time_completed = elapsed
	
func stopTimer():
	# adding timeout delay of 0.1 seconds here otherwise enemy_score does not update to 0 correctly
	var t = Timer.new()
	t.set_wait_time(0.1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	print("Stopping timer")
	
	print(get_node("/root/game_state").user_time_completed)
	print("BEST TIME: ",get_node("/root/game_state").best_time)
	set_fixed_process(false)