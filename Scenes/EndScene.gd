extends Node2D

@onready var FinalScoreLabel = $CanvasLayer/ScoreBoard/PlayerScore
@onready var FinalObjDestroyed = $CanvasLayer/ScoreBoard/ObjDestroyed

func _ready():
	FinalScoreLabel.text = "Final score: " + str(Global.PlayerScore)
	FinalObjDestroyed.text = "Objects destroyed: " + str(Global.ObjectsDestroyed)


func _on_start_btn_pressed():
	Global.PlayerScore = 0
	Global.ObjectsDestroyed = 0
	get_tree().change_scene_to_file("res://main.tscn")
