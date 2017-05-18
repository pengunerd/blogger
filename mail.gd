
extends Area2D

# Member variables
var taken = false
#var mail_score=0

func _on_body_enter( body ):
	if (not taken and body extends preload("res://playerChibi.gd")):
		get_node("anim").play("taken-mail")
		taken = true
		print("MAIL taken")
		get_node("/root/game_state").mail_score+=1
		#print(mail_score)


func _on_coin_area_enter(area):
	pass # replace with function body


func _on_coin_area_enter_shape(area_id, area, area_shape, area_shape):
	pass # replace with function body
