extends Node2D

var current_cutscene="none"
func _process(delta):
	Global.current_cutscene = current_cutscene
	
	if Global.newfarmingzone_activate == true:
		if current_cutscene == "none":
			current_cutscene="newfarmingzone"
			
