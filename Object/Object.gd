extends RigidBody2D
@export var objectScore := 0
@export var animationtoplay := ""
@export var goaway := ""
var timesplayed := 1
@onready var sprite = $Sprite2D/AnimationPlayer

func _on_area_2d_area_entered(area):
	if area.name == "Floor":
		if timesplayed >= 0:
			sprite.play(animationtoplay)
			timesplayed = 0


func _on_area_2d_3_body_entered(body):
	if body.name == "PlayerCat":
		Global.PlayerScore+=objectScore
		Global.ObjectsDestroyed +=1
		queue_free()

func _on_area_2d_body_entered(body):
	if body.name == "PlayerCat":
		SignalBus.Stun_Player.emit()
		queue_free()


func _on_animation_player_animation_finished(anim_name):
	print("ergio")
	print(anim_name)
	queue_free()
