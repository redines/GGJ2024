extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_area_2d_area_entered(area):
	if area.name == "Floor":
		queue_free()


func _on_area_2d_3_body_entered(body):
	if body.name == "PlayerCat":
		Global.PlayerScore+=5
		print("Total Score:", Global.PlayerScore)
		
		queue_free()
	pass # Replace with function body.
