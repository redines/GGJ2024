extends RigidBody2D
@export var objectScore := 0

func _on_area_2d_area_entered(area):
	if area.name == "Floor":
		queue_free()

func _on_area_2d_3_body_entered(body):
	if body.name == "PlayerCat":
		Global.PlayerScore+=objectScore
		Global.ObjectsDestroyed +=1
		queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "PlayerCat":
		SignalBus.Stun_Player.emit()
		queue_free()
