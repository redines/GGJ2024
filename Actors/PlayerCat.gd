class_name Player
extends CharacterBody2D
const GRAVITY = 200.0

###Node initialization
@onready var fsm := $StateMachine

###Player stats
@export var PlayerSpeed := 200.0
@export var PlayerJump := 200.0
@export var MaxHealth := 3
@export var dashSpeed: = 500.0
var dashing = false
var NO_SLOPE = 64.0
var DashAmount = 1

