extends StaticBody2D

var state = "day"
var change_state = false
var lengthofday = 30
var lengthofnight = 30
func _ready():
	if state == "day":
		$ColorRect.color.a =0
		change_to_day()
	elif state == "night":
		$ColorRect.color.a =150
		change_to_night()

func _on_Timer_timeout():
	if state== "day":
		state = "night"
	elif state == "night":
		state = "day"
		
	change_state = true


func _process(delta):
	_update_state()
func _update_state():
	if change_state:
		change_state = false
		if state== "day":
			change_to_day()
		elif state=="night":
			change_to_night()

func change_to_day():
	$AnimationPlayer.play("nighttoday")
	$Timer.wait_time=lengthofday
	$Timer.start()

func change_to_night():
	$AnimationPlayer.play("daytonight")
	$Timer.wait_time=lengthofnight
	$Timer.start()
	
