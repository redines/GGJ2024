extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	if !player.stunned:
		if not player.is_on_floor():
			state_machine.transition_to("Air")
			return
		
		player.anim.play("Idle_Animation")

		if Input.is_action_just_pressed("jump"):
			state_machine.transition_to("Air", {do_jump = true})
			player.anim.play("Jump_Animation")
		elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
			state_machine.transition_to("Run")
