extends Node2D

@onready var TimeLabel = $CanvasLayer/Panel/Time
@onready var LevelTimer = $Timer
@onready var ScoreLabel = $CanvasLayer/Panel/Label
@onready var sp = $Spawners/Spawner1
@onready var spTwo = $Spawners/Spawner2
@onready var spThree = $Spawners/Spawner3
@onready var spFour = $Spawners/Spawner4

var randomOne = RandomNumberGenerator.new()
var randomTwo = RandomNumberGenerator.new()
var randomThree = RandomNumberGenerator.new()
var randomFour = RandomNumberGenerator.new()

var t = [
	preload("res://Object/Glass.tscn"),
	preload("res://Object/Plate.tscn"),
	preload("res://Object/Vase.tscn")
]

func _ready():
	randomOne.randomize()
	randomTwo.randomize()
	randomThree.randomize()
	randomFour.randomize()

func _process(_delta):
	ScoreLabel.text = "Score: " + str(Global.PlayerScore)
	TimeLabel.text = "Time: " + "%02d" % floor(int(LevelTimer.time_left) % 60)

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/EndScene.tscn")

func _on_spawn_t_imer_timeout():
	var Vas = t[randomOne.randi_range(0, 2)].instantiate()
	add_child(Vas)
	Vas.position = sp.position
	$Spawners/SpawnTImer.set_wait_time(randomOne.randf_range(4, 12))
	$Spawners/SpawnTImer.start()

func _on_spawn_t_imer_2_timeout():
	var Vas = t[randomTwo.randi_range(0, 2)].instantiate()
	add_child(Vas)
	Vas.position = spTwo.position
	$Spawners/SpawnTImer2.set_wait_time(randomTwo.randf_range(4, 12))
	$Spawners/SpawnTImer2.start()

func _on_spawn_t_imer_3_timeout():
	var Vas = t[randomThree.randi_range(0, 2)].instantiate()
	add_child(Vas)
	Vas.position = spThree.position
	$Spawners/SpawnTImer3.set_wait_time(randomThree.randf_range(4, 12))
	$Spawners/SpawnTImer3.start()


func _on_spawn_t_imer_4_timeout():
	var Vas = t[randomFour.randi_range(0, 2)].instantiate()
	add_child(Vas)
	Vas.position = spFour.position
	$Spawners/SpawnTImer4.set_wait_time(randomFour.randf_range(4, 12))
	$Spawners/SpawnTImer4.start()
