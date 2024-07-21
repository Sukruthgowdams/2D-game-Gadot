extends StaticBody2D

var  item = 1
var item1price = 100
var item2price = 250
var item1owned = false
var item2owned = false
var price
func _ready():
	$icon.play("berryseed")
	item = 1
func _physics_process(delta):
	if self.visible == true:
		if item ==1 :
			$icon.play("berryseed")
			$pricelabel.text = "100"
			if Global.coins>= item1price:
				$buybuttoncolor.color="65bc6a" #green
			else:
				$buybuttoncolor.color="bc8665"#red
		else:
			$buybuttoncolor.color="bc8665"#red
		if item == 2:
			$icon.play("randomseed")
			$pricelabel.text = "250"
			if Global.coins>= item2price:
				$buybuttoncolor.color="65bc6a" #green
			else:
				$buybuttoncolor.color="bc8665"#red
		else:
			$buybuttoncolor.color="bc8665"#red
			
func _on_Buttonleft_pressed():
	swap_item_back()


func _on_Buttonright_pressed():
	swap_item_front()

func _on_buybutton_pressed():
	if item ==1:
		price = item1price
		if Global.coins>= price:
			if item1owned== false:
				buy()
	elif item ==2:
		price = item2price
		if Global.coins>= price:
			if item2owned== false:
				buy()

func swap_item_back():
	if item == 1:
		item=2
	elif item ==2:
		item = 1
func swap_item_front():
	if item == 1:
		item =2
	elif item ==2:
		item = 1

func buy():
	Global.coins -=price
	if item ==1:
		item1owned=true
	if item ==2:
		item2owned = true
		
