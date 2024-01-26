extends PlayerState


func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func physics_update(_delta: float) -> void:
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")
