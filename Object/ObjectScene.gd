extends Node2D

var Obj = preload("res://Object/object.tscn")

func _on_spawn_timeout():
	var Vas = Obj.instantiate()
	add_child(Vas)
	Vas.position = $Spawner.position


func _on_spawn_2_timeout():
	var Vas = Obj.instantiate()
	add_child(Vas)
	Vas.position = $Spawner2.position


func _on_spawn_3_timeout():
	var Vas = Obj.instantiate()
	add_child(Vas)
	Vas.position = $Spawner3.position
