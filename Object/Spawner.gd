extends Node2D

const Obj = preload("res://Object/ObjectScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Helli hello")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_spawn_timeout():
	var Obj = Obj.instantiate()
	add_child(Obj)
	Obj.position = $Spawner.position
	pass # Replace with function body.
