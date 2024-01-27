extends Node2D

var Obj = preload("res://object.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_spawn_timeout():
	var Vas = Obj.instantiate()
	add_child(Vas)
	Vas.position = $Spawner.position
	
	
	pass # Replace with function body.


func _on_spawn_2_timeout():
	var Vas = Obj.instantiate()
	add_child(Vas)
	Vas.position = $Spawner2.position
	pass # Replace with function body.


func _on_spawn_3_timeout():
	var Vas = Obj.instantiate()
	add_child(Vas)
	Vas.position = $Spawner3.position
	pass # Replace with function body.
