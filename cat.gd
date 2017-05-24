
extends Node2D

# Member variables
var taken = false
var player_chibi_class= preload("res://playerChibi.gd")

#var mail_score=0


func _on_cat_body_enter( body ):
	if (not taken and body extends player_chibi_class):
		#get_node("anim").play("taken-mail")
		#taken = true
		print("BOUNCE CHAR")
		if(get_node("/root/stage/player")):
			print("Player found")
			var catPos = self.get_global_pos()
			print(catPos)
			#get_node("/root/stage/player").set_linear_velocity(-150,get_linear_velocity().y)
			
		else:
			print("no player found :(")
		
		#player.apply_impulse(Vector2(0,0),Vector2(0,50))
		#player_chibi
		
		#get_node("/root/game_state").mail_score+=1
		#print(mail_score)


func _on_coin_area_enter(area):
	pass # replace with function body


func _on_cat_area_enter_shape(area_id, area, area_shape, area_shape):
	print("HELLLOOOOO")
	pass # replace with function body
	

func _ready():
	#enemy = ResourceLoader.load("res://enemy.tscn")
	connect("body_enter", self, "on_cat_body_enter")
	#var start_pos = get_pos()
	#print("CAT Start Pos is ", start_pos)
