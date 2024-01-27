class_name Player
extends CharacterBody2D
const GRAVITY = 200.0

###Node initialization
@onready var fsm := $StateMachine
@onready var stuntimer = $Timer
@onready var anim = $Sprite2D/AnimationPlayer
@onready var sprite = $Sprite2D
@onready var attacktimer = $AttackTimer

@onready var jumpSound = $JumpSound

###Player stats
@export var PlayerSpeed := 200.0
@export var PlayerJump := 200.0
@export var MaxHealth := 3
@export var dashSpeed: = 500.0
var dashing = false
var NO_SLOPE = 64.0
var DashAmount = 1
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
