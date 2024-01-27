extends Node2D

@onready var TimeLabel = $CanvasLayer/Panel/Time
@onready var LevelTimer = $Timer

func _ready():
	pass

func _process(_delta):
	TimeLabel.text = "%02d" % floor(int(LevelTimer.time_left) % 60)

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/EndScene.tscn")
