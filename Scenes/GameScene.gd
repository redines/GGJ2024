extends Node2D

@onready var TimeLabel = $CanvasLayer/Panel/Time
@onready var LevelTimer = $Timer
@onready var ScoreLabel = $CanvasLayer/Panel/Label
@onready var sp = $Spawners/Spawner1
@onready var spTwo = $Spawners/Spawner2
@onready var spThree = $Spawners/Spawner3

@export var ObjScore1 := 0
@export var ObjScore2 := 0
@export var ObjScore3 := 0

var Obj = preload("res://Object/object.tscn")
var randomOne = RandomNumberGenerator.new()
var randomTwo = RandomNumberGenerator.new()
var randomThree = RandomNumberGenerator.new()

func _ready():
	randomOne.randomize()
	randomTwo.randomize()
	randomThree.randomize()

func _process(_delta):
	ScoreLabel.text = "Score: " + str(Global.PlayerScore)
	TimeLabel.text = "Time: " + "%02d" % floor(int(LevelTimer.time_left) % 60)

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/EndScene.tscn")

func _on_spawn_t_imer_timeout():
	var Vas = Obj.instantiate()
	Vas.objectScore = ObjScore1
	add_child(Vas)
	Vas.position = sp.position
	$Spawners/SpawnTImer.set_wait_time(randomOne.randf_range(4, 12))
	$Spawners/SpawnTImer.start()

func _on_spawn_t_imer_2_timeout():
	var Vas = Obj.instantiate()
	Vas.objectScore = ObjScore2
	add_child(Vas)
	Vas.position = spTwo.position
	$Spawners/SpawnTImer2.set_wait_time(randomTwo.randf_range(4, 12))
	$Spawners/SpawnTImer2.start()

func _on_spawn_t_imer_3_timeout():
	var Vas = Obj.instantiate()
	Vas.objectScore = ObjScore3
	add_child(Vas)
	Vas.position = spThree.position
	$Spawners/SpawnTImer3.set_wait_time(randomThree.randf_range(4, 12))
	$Spawners/SpawnTImer3.start()
