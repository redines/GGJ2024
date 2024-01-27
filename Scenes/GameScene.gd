extends Node2D

@onready var TimeLabel = $CanvasLayer/Panel/Time
@onready var LevelTimer = $Timer
@onready var ScoreLabel = $CanvasLayer/Panel/Label

func _ready():
	ScoreLabel.text = "Score: " + str(Global.PlayerScore)

func _process(_delta):
	TimeLabel.text = "Time: " + "%02d" % floor(int(LevelTimer.time_left) % 60)

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/EndScene.tscn")
