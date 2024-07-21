extends StaticBody2D

var plant =Global.plantselected
var plantgrowing = false
var plant_grown = false

func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantselected



func _on_Area2D_area_entered(area):
	if not plantgrowing:
		if plant ==1:
			plantgrowing= true
			$carrot.start()
			$plant.play("carrot")
			
		if plant ==2:
			plantgrowing= true
			$onion.start()
			$plant.play("onion")
		if plant ==3:
			plantgrowing= true
			$berry.start()
			$plant.play("berry")
	else:
		print("Plant is alreay growing here")


func _on_carrot_timeout():
	var carrot_plant= $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame=1
		$carrot.start()
	elif carrot_plant.frame == 1 :
		carrot_plant.frame=2
		plant_grown= true


func _on_onion_timeout():
	var onion_plant= $plant
	if onion_plant.frame == 0:
		onion_plant.frame=1
		$carrot.start()
	elif onion_plant.frame == 1 :
		onion_plant.frame=2
		plant_grown= true


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant ==1:
				Global.numofcarrots +=1
				plantgrowing= false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.numofonions +=1
				plantgrowing= false
				plant_grown = false
				$plant.play("none")
			if plant == 3:
				Global.numofberries +=1
				plantgrowing= false
				plant_grown = false
				$plant.play("none")
			else:
				pass
		print("Number of carrots :"+ str(Global.numofcarrots))
		print("Number of carrots :"+ str(Global.numofonions))
		print("Number of berries :"+ str(Global.numofberries))


func _on_berry_timeout():
	var berry_plant = $plant
	if berry_plant.frame == 0:
		berry_plant.frame=1
		$berry.start()
	elif berry_plant.frame == 1 :
		berry_plant.frame=2
		plant_grown= true
