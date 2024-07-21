extends KinematicBody2D
var eating = false
var walking = false 

var xdir = 1# 1 = right -1 = lrft
var ydir = 1# up down
var speed = 5
var motion = Vector2()
var moving_vertical_horizontal = 1# 1=hor 2 =vertical

func _ready():
	walking = true
	randomize()
	
func _physics_process(delta):
	var waittime = 1
	if walking== false:
		var x = rand_range(1,2)
		if x > 1.5:
			moving_vertical_horizontal =1
		else:
			moving_vertical_horizontal=2
	if walking == true:
		$AnimatedSprite.play("walking")
		if moving_vertical_horizontal ==1:
			if xdir==-1:
				$AnimatedSprite.flip_h = true
			if xdir ==1:
				$AnimatedSprite.flip_h= false
			motion.x = speed * xdir
			motion.y = 0
		elif moving_vertical_horizontal ==2:
			motion.y = speed * ydir
			motion.x = 0
		
	if  eating== true:
		$AnimatedSprite.play("eating")
		motion.x=0
		motion.y =0
	move_and_slide(motion)
	
func _on_changestatetimer_timeout():
	var waittime = 1 
	if walking == true:
		eating = true
		walking = false
		waittime = rand_range(1, 5)
	elif eating == true:
		eating = false  
		walking = true
		waittime = rand_range(2, 6)
	$changestatetimer.wait_time = waittime
	$changestatetimer.start()


func _on_walkingtimer_timeout():
	var x =rand_range(1,2)
	var y =rand_range(1,2)
	var waittime = rand_range(1,4)
	
	if x > 1.5:
		xdir =1
	else:
		xdir = -1
	if y > 1.5:
		ydir = 1
	else :
		ydir=-1
	$walkingtimer.wait_time = waittime
	$walkingtimer.start()
