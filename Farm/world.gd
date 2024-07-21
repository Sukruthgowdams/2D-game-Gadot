extends Node2D
const camera_pos1x = 160
const camera_pos1y = 90

const camera_pos2x = -30
const camera_pos2y = 90
func _ready():
	$area2/ColorRect.rect_size.x = 129
func _physics_process(delta):
	$carrottext.text =("= " + str(Global.numofcarrots))
	$oniontext.text =("= " + str(Global.numofonions))
	$coinstext.text  =("= " + str(Global.coins))
	
	if Global.camera_pos == 1:
		$Camera2D.position.x = camera_pos1x
		$Camera2D.position.y = camera_pos1y
	elif Global.camera_pos ==2:
		$Camera2D.position.x = camera_pos2x
		$Camera2D.position.y = camera_pos2y
		

func _on_openfarmingzone2_body_entered(body):
	if body.has_method("player"):
		if $area2/openfarmingzone2/CollisionShape2D.disabled == false:
			Global.camera_pos = 2
			$area2/AnimationPlayer.play("builtfield")
			$area2/openfarmingzone2/CollisionShape2D.disabled = true
