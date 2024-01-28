class_name Player
extends CharacterBody2D
@export var GRAVITY = 200.0

###Node initialization
@onready var fsm := $StateMachine
@onready var stuntimer = $Timer
@onready var anim = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D

@onready var jumpSound = $JumpSound
@onready var attacksound = $attack

###Player stats
@export var PlayerSpeed := 200.0
@export var PlayerJump := 200.0
@export var MaxHealth := 3
@export var PlayerAttack := 200
var stunned = false

func _ready():
	SignalBus.Stun_Player.connect(stun_Player)

func stun_Player():
	stunned = true
	stuntimer.start()
	anim.play("Stun_Animation")

func _on_timer_timeout():
	stunned = false
	print("player can move")
